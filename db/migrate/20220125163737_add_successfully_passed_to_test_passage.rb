# frozen_string_literal: true

class AddSuccessfullyPassedToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :successfully_passed?, :boolean, default: false
  end
end
