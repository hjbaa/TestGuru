class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :find_question, only: %i[show edit update]
  before_action :find_test, only: %i[new create]

  def index
    @questions = Question.where(test_id: params[:test_id])
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was created!'
    else
      render plain: "Question wasn't created! Errors: #{@question.errors.messages}", status: :unprocessable_entity
    end
  end

  def new
    @question = Question.new
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was updated!'
    else
      render plain: 'Test was not updated!', status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test), notice: 'Question was destroyed!'
    # просто redirect_to @question.test редиректит на метод show контроллера test и в его соответсвующую форму
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
    render plain: 'Вопрос не был найден!'
  end
end
