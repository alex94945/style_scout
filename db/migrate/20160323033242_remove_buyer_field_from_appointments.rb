class RemoveBuyerFieldFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :buyer
  end
end
