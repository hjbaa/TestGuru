# frozen_string_literal: true

class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :find_question, only: %i[show edit update destroy]
  before_action :find_test, only: %i[new create]

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @question = @test.questions.new
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test, notice: 'Question was destroyed!'
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:title)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
