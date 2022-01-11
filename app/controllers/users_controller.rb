# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def show
    @tests = current_user.created_tests
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the app, #{@user.login}!"
      redirect_to cookies[:requested_page]
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :login, :password, :password_confirmation)
  end
end
