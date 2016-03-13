class AddPriceFieldsToStyleAndVariation < ActiveRecord::Migration
  def change
  	add_column :variations, :negotiated_price, :decimal, :precision => 10, :scale => 2

  	add_column :styles, :negotiated_price, :decimal, :precision => 10, :scale => 2
  	add_column :styles, :retail_price, :decimal, :precision => 10, :scale => 2
  	add_column :styles, :wholesale_price, :decimal, :precision => 10, :scale => 2
  end
end
