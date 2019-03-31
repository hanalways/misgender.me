class CreateJoinTableUsernameQuery < ActiveRecord::Migration[5.2]
  def change
    create_join_table :usernames, :queries do |t|
      # t.index [:username_id, :query_id]
      # t.index [:query_id, :username_id]
    end
  end
end
