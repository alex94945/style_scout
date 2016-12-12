class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :merch_month
      t.references :user, index: true
      t.decimal :value, precision: 20 , scale: 2
      t.integer :year
      t.timestamps null: false
    end
  end
end
