class RenameWholesalePriceAndNegotiatedPrice < ActiveRecord::Migration
  def change
    rename_column :styles, :wholesale_price, :wholesale_cost
    rename_column :styles, :negotiated_price, :negotiated_cost
  end
end
