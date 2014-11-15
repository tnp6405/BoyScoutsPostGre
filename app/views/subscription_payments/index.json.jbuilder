json.array!(@subscription_payments) do |subscription_payment|
  json.extract! subscription_payment, :id, :subscription_payment_id, :subscription_id, :amount_paid, :date_paid, :good_till, :paypal, :notes
  json.url subscription_payment_url(subscription_payment, format: :json)
end
