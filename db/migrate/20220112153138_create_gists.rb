# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true
      t.string :url, null: false
      t.references :creator, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
