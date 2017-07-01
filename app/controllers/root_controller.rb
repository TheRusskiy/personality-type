class RootController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'application'
  def index
  end


  def current_user
    current_user
  end
end
