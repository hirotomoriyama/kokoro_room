class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :advice_id
      t.integer :member_id
      t.text :body

      t.timestamps
    end
  end
end
