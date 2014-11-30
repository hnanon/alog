class AddAttributesToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :price, :decimal
    add_column :variants, :compare_at_price, :decimal
    add_column :variants, :sku, :string
    add_column :variants, :weight, :decimal
    add_column :variants, :weight_uom, :string
    add_column :variants, :barcode, :string
    add_column :variants, :taxable, :boolean
    add_column :variants, :requires_shipping, :boolean
    add_column :variants, :quantity, :integer
    add_column :variants, :inventory_policy, :boolean
  end
end
