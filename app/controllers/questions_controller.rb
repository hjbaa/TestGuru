class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :find_question, only: %i[show edit destroy update]

  def index
    @questions = Question.where(test_id: params[:test_id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to test_questions_path, notice: 'Question was created!'
    else
      render plain: "Question wasn't created! #{@question.errors.messages}, title: #{@question.title}", status: :unprocessable_entity
    end
  end

  def new
    @question = Question.new
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_questions_path(test_id: @question.test_id), notice: 'Question was updated!'
    else
      render plain: 'Test was not updated!', status: :unprocessable_entity
    end
  end

  def destroy
    test_id = @question.test_id
    @question.destroy
    redirect_to test_questions_path(test_id: test_id), notice: 'Question was destroyed!'
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:test_id, :title)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не был найден!'
  end
end
