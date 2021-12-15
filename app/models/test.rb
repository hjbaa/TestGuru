class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.tests_by_category(category_name)
    Test.joins(:category)
        .where(categories: { title: category_name })
        .order(title: :desc)
        .pluck(:title)
  end
end
