# frozen_string_literal: true

# Модель категории
class Category < ApplicationRecord
  validates :title, presence: true

  has_many :tests, dependent: :nullify

  scope :titles, -> { order(title: :asc) }
end
