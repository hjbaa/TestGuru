class User < ApplicationRecord
  has_many :tests_by_users, dependent: :destroy
  has_many :tests, through: :tests_by_users

  def passed_tests(tests_level)
    Test.joins(:users).where(tests: { level: tests_level })
  end

  def self.asd
    User.joins(:tests)
  end
end
