class RemoveOptionIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :option_id, :reference
  end
end
