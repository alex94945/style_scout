class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	t.string :name
    	t.date :scout_date
    	t.string :planner
    	t.string :vendor
    	t.string :location
    	t.text :notes
      t.timestamps null: false
    end
  end
end
