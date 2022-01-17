# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result time_expired]

  def show; end

  def result; end

  def update
    if @test_passage.expired?
      @test_passage.update(current_question: nil, correct_questions: 0)
      flash[:danger] = 'Time is over! You failed the test!'
      redirect_to result_test_passage_path(@test_passage)
      return
    end

    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
