class QuizRequestsController < ApplicationController
  protect_from_forgery with: :exception

  layout 'application'

  def create
    @user = User.find(params[:user_id])
    @user.quiz_requests.create!
    render json: { user: @user.in_json }
  end
end
