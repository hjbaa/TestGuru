# frozen_string_literal: true

# Модель вопроса
class Question < ApplicationRecord
  validates :title, presence: true

  belongs_to :test

  has_many :answers, dependent: :destroy
end
