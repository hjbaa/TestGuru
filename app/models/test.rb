class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: 'author_id'
  has_many :questions
  has_many :tests_by_users, dependent: :destroy
  has_many :users, through: :tests_by_users

  def self.tests_by_category(category_name)
    Test.joins(:category).where(categories: { title: category_name }).order(title: :desc).pluck(:title)
  end
end
