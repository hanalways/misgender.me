class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.string :twitter_handle
      t.string :real_gender
      t.string :ethnicity

      t.timestamps
    end
  end
end
