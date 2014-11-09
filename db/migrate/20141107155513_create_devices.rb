class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :manufacturer, index: true
      t.references :carrier, index: true
      t.string :model

      t.timestamps
    end
  end
end
