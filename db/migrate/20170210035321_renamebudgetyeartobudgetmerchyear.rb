class Renamebudgetyeartobudgetmerchyear < ActiveRecord::Migration
  def change
    rename_column :budgets, :year, :merch_year
  end
end
