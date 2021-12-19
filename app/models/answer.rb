# frozen_string_literal: true

# Модель ответа на вопрос
class Answer < ApplicationRecord
  belongs_to :question

  validates :content, presence: true
  validate :validate_max_answer_amount, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answer_amount
    errors.add :base, :invalid_amount, message: 'Too many answers!' if question.answers.count > 3
    # в условии написано больше 3, а не 4, т.к. пятый вопрос создается и добавляется в БД при >4
  end
end
