class SessionsController < ApplicationController
  wrap_parameters format: []

  def create
    user = User.find_by(name: user_params[:name])
    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :password)
  end
end
