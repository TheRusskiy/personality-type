class QuizResultsController < ApplicationController
  protect_from_forgery with: :exception

  layout 'application'
  def index
    @show_results = true
    @users = User.all
  end

  def new
    @user = User.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @user.quiz_results.create!({
      personality_type: params[:personality_type]
    })
    render json: {}
  end
end
