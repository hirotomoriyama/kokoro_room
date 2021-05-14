class AddBodyToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :body, :text
  end
end
