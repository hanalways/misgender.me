class CreateJoinTableGenderQuery < ActiveRecord::Migration[5.2]
  def change
    create_join_table :genders, :queries do |t|
      # t.index [:gender_id, :query_id]
      # t.index [:query_id, :gender_id]
    end
  end
end
