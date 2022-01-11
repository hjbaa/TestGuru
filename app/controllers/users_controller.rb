# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def show
    @tests = current_user.created_tests
  end

  def new
    @user = User.new
  end

  # rubocop:disable Metrics/AbcSize
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the app, #{@user.login}!"

      if cookies[:requested_page].present?
        redirect_to cookies[:requested_page]
        cookies.delete :requested_page
      else
        redirect_to root_path
      end

    else
      render :new
    end
  end
  # rubocop:enable Metrics/AbcSize

  private

  def user_params
    params.require(:user).permit(:email, :login, :password, :password_confirmation)
  end
end
