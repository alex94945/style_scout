class RenameAppointmentsToProductSets < ActiveRecord::Migration
  def change
    rename_table :appointments, :product_sets
    rename_column :profile_configs, :default_home_my_appointments, :default_home_my_product_sets
    rename_column :styles, :appointment_id, :product_set_id
  end
end
