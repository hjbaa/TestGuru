class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :description
      t.string :image
      t.integer :rule, null: false
      t.string :test_name
      t.string :test_category
      t.integer :test_level
      t.timestamps
    end
  end
end
