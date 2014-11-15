class RemoveOptionIdFromVariants < ActiveRecord::Migration
  def change
    remove_reference :variants, :option, index: true
  end
end
