class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  before_action :find_test, only: %i[show edit update destroy]


  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test, notice: 'Test was created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Test was updated!'
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Test was destroyed!'
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found!'
  end
end
