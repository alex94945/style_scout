class CreateProfileConfig < ActiveRecord::Migration
  def change
    create_table :profile_configs do |t|
      t.boolean :default_home_my_appointments, default: false
      t.string :navbar_color

      t.references :user
      t.timestamps null: false
    end
  end
end
