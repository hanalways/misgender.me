class DropQueriesForce < ActiveRecord::Migration[5.2]
  def change
    drop_table :queries
  end
end
