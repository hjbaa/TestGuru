# frozen_string_literal: true

# Модель вопроса
class Question < ApplicationRecord
  validates :title, presence: true
  # validate :validates_max_answers_num

  belongs_to :test

  has_many :answers, dependent: :destroy

  #private

  # def validates_max_answers_num
  #   errors.add(:answers) if answers.count > 4
  # end
end
