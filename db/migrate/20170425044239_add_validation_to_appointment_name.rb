class AddValidationToAppointmentName < ActiveRecord::Migration
  def change
    change_column_null :appointments, :name, false
  end
end
