class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order, index: true
      t.string :product_sku
      t.string :product_description
      t.integer :quantity

      t.timestamps
    end
  end
end
