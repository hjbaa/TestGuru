# frozen_string_literal: true

class ChangeUsersColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :password, :password_digest
    add_column :users, :name, :string, default: '', null: false
    add_column :users, :surname, :string, default: ''
    remove_column :users, :login, :string
    add_column :users, :type, :string, null: false, default: 'User'
  end
end
