class CreateJoinTableEthnicityQuery < ActiveRecord::Migration[5.2]
  def change
    create_join_table :ethnicities, :queries do |t|
      # t.index [:ethnicity_id, :query_id]
      # t.index [:query_id, :ethnicity_id]
    end
  end
end
