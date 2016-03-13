class ChangePlannerToBuyer < ActiveRecord::Migration
  def change
  	rename_column :appointments, :planner, :buyer
  end
end
