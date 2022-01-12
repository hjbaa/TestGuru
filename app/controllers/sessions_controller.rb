# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Welcome back, #{current_user.name}"
  end

  protected

  def after_sign_in_path_for(_resource)
    return '/admin/tests' if current_user.is_a?(Admin)

    '/'
  end
end
