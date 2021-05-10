class AddMemberIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :member_id, :integer
  end
end
