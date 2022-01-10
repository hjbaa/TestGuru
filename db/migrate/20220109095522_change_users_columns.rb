class ChangeUsersColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :password, :password_digest
    add_index :users, :email, unique: true, name: 'unique_emails'
    add_index :users, :login, unique: true, name: 'unique_logins'
    add_column :users, :remember_token_digest, :string
  end
end
