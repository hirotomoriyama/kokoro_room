class RenameImageColumnToMembers < ActiveRecord::Migration[5.2]
  def change
    rename_column :members, :image, :image_id
  end
end
