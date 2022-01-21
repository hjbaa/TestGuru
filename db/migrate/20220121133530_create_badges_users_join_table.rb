class CreateBadgesUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :badges, :users do |t|
      t.index %i[user_id badge_id], unique: true
    end
  end
end
