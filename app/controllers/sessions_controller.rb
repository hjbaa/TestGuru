# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new; end

  # rubocop:disable Metrics/AbcSize
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.login}"

      redirect_to cookies.delete(:requested_page) || root_path
    else
      flash.now[:danger] = 'Incorrect email and/or password!'
      render :new
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    session.destroy
    redirect_to root_path
  end
end
