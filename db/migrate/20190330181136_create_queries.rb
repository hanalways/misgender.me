class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.boolean :consent

      t.timestamps
    end
  end
end
