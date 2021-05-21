class RemoveMemberIdFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :member_id, :integer
  end
end
