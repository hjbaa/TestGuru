# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :delete_all
  has_many :tests, through: :test_passages

  validates :email, :login, :password, presence: true

  def passed_tests(tests_level)
    tests.where(level: tests_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
