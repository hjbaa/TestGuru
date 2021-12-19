# frozen_string_literal: true

# Модель вопроса
class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :title, presence: true
end
