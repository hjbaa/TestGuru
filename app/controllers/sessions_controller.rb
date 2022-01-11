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

      if cookies[:requested_page].present?
        redirect_to cookies[:requested_page]
        cookies.delete :requested_page
      else
        redirect_to root_path
      end

    else
      flash.now[:warning] = 'Incorrect email and/or password!'
      render :new
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    session.destroy
    redirect_to root_path
  end
end
