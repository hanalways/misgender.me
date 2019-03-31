class AddUsernameToQueries < ActiveRecord::Migration[5.2]
  def change
    add_column :queries, :username, :string
  end
end
