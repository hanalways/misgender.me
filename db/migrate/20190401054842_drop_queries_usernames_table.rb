class DropQueriesUsernamesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :queries_usernames
  end
end
