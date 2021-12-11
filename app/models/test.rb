class Test < ApplicationRecord
  class << self
    def tests_by_category(category_name)
      Test.select(:title).from('tests, categories').where('tests.category_id = categories.id AND categories.title = ?',
                                                          category_name).order(title: :desc)
    end
  end
end
