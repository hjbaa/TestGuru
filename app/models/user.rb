class User < ApplicationRecord
  def passed_tests(tests_level)
    Test.joins('JOIN users, tests_by_users').select(:title).distinct.where(
      'tests_by_users.user_id = ? AND tests_by_users.test_id = tests.id AND tests.level = ?', id, tests_level
    )
  end
end
