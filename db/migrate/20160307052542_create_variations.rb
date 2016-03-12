class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
    	t.string :color
    	t.decimal :wholesale_price, :precision => 10, :scale => 2
    	t.decimal :retail_price, :precision => 10, :scale => 2
    	t.date :begin_shipment_window_date
    	t.date :end_shipment_window_date
    	t.string :sizing_schema
    	t.string :size
    	t.text :notes
    	t.references :style
      t.timestamps null: false
    end
  end
end
