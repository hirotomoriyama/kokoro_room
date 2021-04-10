class CreateAdvices < ActiveRecord::Migration[5.2]
  def change
    create_table :advices do |t|
      t.integer :problem_id
      t.integer :member_id
      t.text :body

      t.timestamps
    end
  end
end
