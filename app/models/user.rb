class User < ApplicationRecord
  def passed_tests(tests_level)
    Test.select(:title).distinct.from('tests, users, tests_by_users').where(
      'tests_by_users.user_id = ? AND tests_by_users.test_id = tests.id AND tests.level = ?', id, tests_level
    )
  end
end
