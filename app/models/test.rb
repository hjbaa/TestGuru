class Test < ApplicationRecord
  def self.tests_by_category(category_name)
    Test.joins('JOIN categories').select(:title).order(title: :desc).where('tests.category_id = categories.id').and(
      Category.where(title: category_name)
    ).pluck(:title)
  end
end
