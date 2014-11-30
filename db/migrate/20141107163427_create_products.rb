class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :type, index: true
      t.references :device, index: true

      t.timestamps
    end
  end
end
