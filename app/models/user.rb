class User < ApplicationRecord
  has_many :tests, foreign_key: 'author_id'
  has_and_belongs_to_many :passed_tests, class_name: 'Test'

  def passed_tests(tests_level)
    Test.joins('JOIN users, tests_by_users').select(:title).distinct.where(
      'tests_by_users.user_id = ? AND tests_by_users.test_id = tests.id AND tests.level = ?', id, tests_level
    )
  end
  def self.asd
    User.joins(:passed_tests)
  end
end
