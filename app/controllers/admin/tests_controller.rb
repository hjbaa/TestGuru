# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def new
    @test = current_user.created_tests.new
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      flash[:success] = 'Test was created!'
      redirect_to admin_test_path(@test)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      flash[:success] = 'Test was updated!'
      redirect_to admin_test_path(@test)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy
    flash[:success] = 'Test was destroyed!'
    redirect_to admin_tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
