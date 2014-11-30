class ChangeColumnVariantsWeightUom < ActiveRecord::Migration
  def change
    change_column :variants, :weight_uom, :integer
    end
end
