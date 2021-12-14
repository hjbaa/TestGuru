class User < ApplicationRecord
  has_many :tests_by_users, dependent: :destroy
  has_many :tests, through: :tests_by_users

  def passed_tests(tests_level)
    Test.joins('INNER JOIN tests_by_users ON tests_by_users.test_id = tests.id').where(
      tests: { level: tests_level }, tests_by_users: { user_id: id }
    )
  end
end
