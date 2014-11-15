class CreateSubscriptionPayments < ActiveRecord::Migration
  def change
    create_table :subscription_payments, {:id=>false} do |t|
      t.primary_key :subscription_payment_id
      t.references :subscription, index: true
      t.decimal :amount_paid
      t.datetime :date_paid
      t.datetime :good_till
      t.boolean :paypal
      t.text :notes

      t.timestamps
    end
  end
end
