class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def create; end

  def new; end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def rescue_with_test_not_found
    render plain: 'Тест не был найден!'
  end
end
