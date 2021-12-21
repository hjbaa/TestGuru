# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :delete_all
  has_many :users, through: :tests_users

  validates :level, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :title, presence: true, uniqueness: {
    scope: :level,
    message: 'There should be only one test with this name and level'
  }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 4..Float::INFINITY) }

  def self.tests_by_category(category_name)
    joins(:category).where(categories: category_name).order(title: :desc).pluck(:title)
  end
end
