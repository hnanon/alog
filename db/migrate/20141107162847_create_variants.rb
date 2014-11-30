class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :name
      t.references :product, index: true

      t.timestamps
    end
  end
end
