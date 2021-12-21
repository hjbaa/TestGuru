# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :tests_users, dependent: :delete_all
  has_many :tests, through: :tests_users

  validates :email, :login, :password, presence: true

  def passed_tests(tests_level)
    tests.where(level: tests_level)
  end
end
