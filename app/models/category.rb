# frozen_string_literal: true

# Модель категории
class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests, dependent: :nullify

  validates :title, presence: true
end
