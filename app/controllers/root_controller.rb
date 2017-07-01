class RootController < ApplicationController
  protect_from_forgery with: :exception

  layout 'application'

  def index
    @users = User.all
  end

  def current_user
    current_user
  end
end
