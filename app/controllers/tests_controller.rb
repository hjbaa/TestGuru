# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy start]

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

  def start
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
