class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: 'author_id'
  has_many :questions

  has_and_belongs_to_many :users

  def self.tests_by_category(category_name)
    Test.joins(:category).where(
      categories: { title: category_name }
    ).order(title: :desc).pluck(:title)
  end

  def self.asd
    Test.joins(:users)
  end
end
