class ChangeColumnToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :provider, :string
    add_column :members, :uid, :string
  end
end
