class SubscriptionPayment < ActiveRecord::Base
  
  belongs_to :subscription
  validates :subscription_payment_id, :uniqueness=>true
  validates :subscription_id, :presence => true
  validates :amount_paid, :presence=>true
  validates :date_paid, :presence=>true
  validates :good_till, :presence=>true
	 
  def subscription= value
    if value.kind_of?(String) and value.to_i.to_s == value
      @subscription = Subscription.find_by_sql("select subscription_id from subscriptions where subscription_id = #{value.to_i}")			
      value = @subscription[0] 	
      super value	
    else
      @subscription = Subscription.find_by_sql("select subscription_id from subscriptions limit 1")
      value = @subscription	
    end
  end


  def generateEnumValue
	@subscriptions = Subscription.find_by_sql("select subscription_id, street, first_name, last_name from subscriptions")
		enum do 
			ary = Array.new
			@subscriptions.each do |t|
				ary1 = Array.new
				ary1.push("#{t.subscription_id}, #{t.street}, #{t.last_name}, #{t.first_name}")
				ary1.push(t.subscription_id)
				ary.push(ary1)
			end
			puts ary
			ary
		end
  end 
  def formatRow
	
  end	
  def subscription_enum
	self.class.send(subscription_id.to_s.pluralize).to_a
  end

  after_initialize do 
	if new_record?
		time = Time.new
		maxId = SubscriptionPayment.find_by_sql("SELECT subscription_payment_id FROM subscription_payments ORDER BY subscription_payment_id DESC limit 1").first.try(:subscription_payment_id)
		values = time.to_a
		self.amount_paid = 30 
		#http://www.tutorialspoint.com/ruby/ruby_date_time.htm
		#to_a method on time object retrieves all different time parametres	
		self.date_paid = "#{values[5]}-#{values[4]}-#{values[3]}T23:59:59Z"
		self.good_till = "2015-12-31T23:59:59Z"
		self.subscription_payment_id = maxId+1
	end
  end 
  rails_admin do
    
   update do
	field :subscription_payment_id do
		label "Subscription Payment ID"
		read_only true
		help ''
	end
        field :subscription do
		label "Subscription ID"
		help 'Required'
	end
	
	field :amount_paid do
		help ''
	end
	field :date_paid, :date do
		help ''
	end
	field :good_till, :date do
		help ''
	end
	field :paypal do
		help ''
	end
	field :notes do
		help ''
	end
    end

	
    show do 
	field :subscription_payment_id do
		label "Subscription Payment ID"
		help "Required"
	end
        field :subscription do
		label "Subscription ID"
		help "Required."
	end
	
	field :amount_paid do
		help ''
	end
	field :date_paid, :date do
		help ''
	end
	field :good_till, :date do
		help ''
	end
	field :paypal do
		help ''
	end
	field :notes do
		help ''
	end
    end

    create do
	field :subscription_payment_id do
		label "Subscription Payment ID"
		read_only true
		help ''
	end

	field :subscription, :enum do
		searchable false
		partial 'test_partial'
		label "Subscription ID"
		help 'Required'
		@subscriptions = Subscription.find_by_sql("select subscription_id, street, first_name, last_name from subscriptions")
		enum do 
			ary = Array.new
			@subscriptions.each do |t|
				ary1 = Array.new
				ary1.push("#{t.subscription_id}, #{t.street}, #{t.last_name}, #{t.first_name}")
				ary1.push(t.subscription_id)
				ary.push(ary1)
			end
			puts ary
			ary
		end
	end

	field :amount_paid do
		help ''
	end

	field :date_paid, :date do
		help ''
	end
	field :good_till, :date do 
		help ''
	end

	field :paypal

	field :notes do
		help ''
	end
    end
  end
end
