# frozen_string_literal: true

class AddSecondsForPassageToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :seconds_for_passage, :integer, min: 60, default: 60, null: false
  end
end
