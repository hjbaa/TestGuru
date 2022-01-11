# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :delete_all
  has_many :tests, through: :test_passages

  has_secure_password

  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :login, presence: true, uniqueness: true

  def passed_tests(tests_level)
    tests.where(level: tests_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
