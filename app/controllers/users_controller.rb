# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_authentication, only: %i[new create]
  before_action :require_no_authentication, only: %i[new create]
  before_action :set_user!, only: %i[edit update show]

  def show
    @tests = current_user.created_tests
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Your profile was successfully updated!'
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the app, #{current_user.login}!"
      redirect_to cookies[:page]
    else
      render :new
    end
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :login, :password, :password_confirmation, :old_password)
  end
end
