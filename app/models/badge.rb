class Badge < ApplicationRecord
  enum rule: { 'Passing all tests in category': 0, 'Passing test on first try': 1,
               'Passing all tests with certain level': 2 }, _suffix: :rule

  has_many :badges_users, class_name: 'BadgesUsers', dependent: :delete_all
  has_many :users, through: :badges_users
end
