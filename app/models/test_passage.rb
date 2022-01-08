# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PASSAGE_THRESHOLD = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def correct_percentage
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def success?
    correct_percentage > PASSAGE_THRESHOLD
  end

  private

  def next_question
    return test.questions.first if current_question.nil?

    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    # у нас нет ограничений, что правильный ответ обязательно должен быть.
    if answer_ids.nil?
      return true if correct_answers.count.zero?

      return false
    end

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def set_current_question
    self.current_question = next_question
  end
end
