# frozen_string_literal: true

# Модель ответа на вопрос
class Answer < ApplicationRecord
  validates :content, presence: true
  validate :validate_ans_count

  belongs_to :question

  # правильный ответ на данный вопрос
  scope :correct_answer, ->(asked_question) { where(correct: true, question_id: asked_question) }

  private

  def validate_ans_count
    errors.add(:question) if question.answers.count > 4
  end
end
