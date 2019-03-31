class DropEthnicityUsername < ActiveRecord::Migration[5.2]
  def change
    drop_table :ethnicities_usernames
  end
end
