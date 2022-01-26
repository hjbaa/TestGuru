# frozen_string_literal: true

class Badge < ApplicationRecord
  enum rule: { all_category_tests: 0, first_try_test: 1, certain_level_tests: 2 }, _suffix: :rule
  # в базе данных хранится число, отображается всегда строка

  validates :name, :rule, :image, :option, presence: true

  has_many :badges_users, class_name: 'BadgesUsers', dependent: :delete_all
  has_many :users, through: :badges_users
end
