class CreateProductOptions < ActiveRecord::Migration
  def change
    create_table :product_options do |t|
      t.references :product, index: true
      t.references :option, index: true

      t.timestamps
    end
  end
end
