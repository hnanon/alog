class AddVendorIdToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :vendor_id, index: true
  end
end
