# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :description
      t.string :image
      t.integer :rule, null: false
      t.string :option
      t.timestamps
    end
  end
end
