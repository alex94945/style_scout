class AddCompanyIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :company
  end
end
