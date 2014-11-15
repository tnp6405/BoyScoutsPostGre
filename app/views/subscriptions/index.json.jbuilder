json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :subscription_id, :route_id, :run_sequence, :number, :street, :qty, :qty_comp, :service_notes, :last_name, :first_name, :phone_number, :email, :city, :state, :zip, :started_date, :last_letter_sent_date, :renewal_x0020_grp, :sold_x0020_By, :subscription_amount, :maint, :subscription_notes, :renewal_due_date, :subscription_status, :alternative_invoice, :map_date
  json.url subscription_url(subscription, format: :json)
end
