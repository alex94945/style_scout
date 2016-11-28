class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
    	t.string :name
    	t.string :taxonomy
    	t.string :vendor_underscore_style_number
    	t.references :appointment # creates appointment ID integer 
      t.timestamps null: false
    end
  end
end
