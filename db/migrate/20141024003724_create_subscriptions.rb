class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions, {:id=>false} do |t|
      t.primary_key :subscription_id
      t.references :route, index: true
      t.integer :run_sequence
      t.string :number
      t.string :street
      t.integer :qty
      t.integer :qty_comp
      t.text :service_notes
      t.string :last_name
      t.string :first_name
      t.string :phone_number
      t.string :email
      t.string :city
      t.string :state
      t.string :zip
      t.datetime :started_date
      t.datetime :last_letter_sent_date
      t.string :renewal_x0020_grp
      t.string :sold_x0020_by
      t.decimal :subscription_amount
      t.string :maint
      t.text :subscription_notes
      t.datetime :renewal_due_date
      t.string :subscription_status
      t.integer :alternative_invoice
      t.datetime :map_date

      t.timestamps
    end
  end
end
