class AddUsersNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :password, false)
    change_column_null(:users, :login, false)
  end
end
