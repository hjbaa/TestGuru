class User < ApplicationRecord
  def passed_tests(tests_level)
    Test.joins('INNER JOIN tests_by_users ON tests_by_users.test_id = tests.id')
        .where(tests: { level: tests_level }, tests_by_users: { user_id: id })
  end
end
