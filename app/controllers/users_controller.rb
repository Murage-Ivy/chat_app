class UsersController < ApplicationController
  def create
    @user = User.create!(user_params)
    session["user_id"] = @user.id
    byebug
    render json: @user, status: :created
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end
