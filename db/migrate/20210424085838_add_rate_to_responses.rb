class AddRateToResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :responses, :rate, :float
  end
end
