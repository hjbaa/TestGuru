class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :tests, through: :tests_users, dependent: :destroy

  def passed_tests(tests_level)
    tests.where(level: tests_level)
  end
end
