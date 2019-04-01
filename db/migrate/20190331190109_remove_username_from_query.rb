class RemoveUsernameFromQuery < ActiveRecord::Migration[5.2]
  def change
    remove_column :queries, :username, :string
  end
end
