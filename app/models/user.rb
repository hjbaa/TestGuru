class User < ApplicationRecord
  has_many :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :tests, through: :tests_users

  def passed_tests(tests_level)
    Test.joins(:users).where(tests: { level: tests_level })
  end
end
