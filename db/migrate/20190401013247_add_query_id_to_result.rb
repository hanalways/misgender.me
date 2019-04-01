class AddQueryIdToResult < ActiveRecord::Migration[5.2]
  def change
    add_reference :results, :query, foreign_key: true
  end
end
