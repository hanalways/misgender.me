class AddQueryIdToUsername < ActiveRecord::Migration[5.2]
  def change
    add_reference :usernames, :query, foreign_key: true
  end
end
