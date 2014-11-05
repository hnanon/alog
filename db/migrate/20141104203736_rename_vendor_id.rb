class RenameVendorId < ActiveRecord::Migration
  def change
    rename_column :orders, :vendor_id_id, :vendor_id
  end
end
