class CreatePaymentAccounts < ActiveRecord::Migration
  def change
    create_table :payment_accounts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :stripe_customer_id
      t.integer :plan_id
      t.integer :status
      t.boolean :trial_period_active

      t.timestamps null: false
    end
  end
end
