class AddProductOptionToVariants < ActiveRecord::Migration
  def change
    add_reference :variants, :product_option, index: true
  end
end
