class RemoveNavbarColorConfig < ActiveRecord::Migration
  def change
    remove_column :profile_configs, :navbar_color
  end
end
