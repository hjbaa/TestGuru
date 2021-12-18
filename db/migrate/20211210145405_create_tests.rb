# frozen_string_literal: true

# Миграция, создающая модель тестов
class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.references :author, null: false, foreign_key: { to_table: :users, column: :id }
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
