class AuthenticationsController < Devise::OmniauthCallbacksController
  
  def create
    auth = request.env['omniauth.auth']
    case request.env['omniauth.params']["as"]
    when 'User'
      user = Customer
    when 'User'
      user = Employee
    else
      redirect_to(root_url, notice: "Please sign in as a User") and return
    end
    # Find an identity here
    @identity = Identity.find_with_omniauth(auth, user)

    if @identity.nil?
      @identity = Identity.create_with_omniauth(auth, user)
    end

    if signed_in?
      if @identity.user == current_user
        redirect_to root_url, notice: "Already linked that account!"
      else
        @identity.user = current_user
        @identity.save!
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        sign_in_and_redirect @identity.user, event: :authentication
      else
        @customer = user.create_with_omniauth(auth)
        @identity.user = @customer
        @identity.save!
        sign_in_and_redirect @customer, event: :authentication
      end
    end
  end

  def failure
    redirect_to root_path
  end
end