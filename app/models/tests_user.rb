# frozen_string_literal: true

# Модель соединительной таблицы между пользователями и тестами
class TestsUser < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
