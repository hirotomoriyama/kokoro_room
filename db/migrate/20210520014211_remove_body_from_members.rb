class RemoveBodyFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :body, :text
  end
end
