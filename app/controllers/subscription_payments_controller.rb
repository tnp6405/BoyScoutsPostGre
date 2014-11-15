class SubscriptionPaymentsController < ApplicationController
  before_action :set_subscription_payment, only: [:show, :edit, :update, :destroy]

  # GET /subscription_payments
  # GET /subscription_payments.json
  def index
    @subscription_payments = SubscriptionPayment.all
  end

  # GET /subscription_payments/1
  # GET /subscription_payments/1.json
  def show
  end

  # GET /subscription_payments/new
  def new
    @subscription_payment = SubscriptionPayment.new
  end

  # GET /subscription_payments/1/edit
  def edit
  end

  # POST /subscription_payments
  # POST /subscription_payments.json
  def create
    @subscription_payment = SubscriptionPayment.new(subscription_payment_params)

    respond_to do |format|
      if @subscription_payment.save
        format.html { redirect_to @subscription_payment, notice: 'Subscription payment was successfully created.' }
        format.json { render :show, status: :created, location: @subscription_payment }
      else
        format.html { render :new }
        format.json { render json: @subscription_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscription_payments/1
  # PATCH/PUT /subscription_payments/1.json
  def update
    respond_to do |format|
      if @subscription_payment.update(subscription_payment_params)
        format.html { redirect_to @subscription_payment, notice: 'Subscription payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription_payment }
      else
        format.html { render :edit }
        format.json { render json: @subscription_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_payments/1
  # DELETE /subscription_payments/1.json
  def destroy
    @subscription_payment.destroy
    respond_to do |format|
      format.html { redirect_to subscription_payments_url, notice: 'Subscription payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_payment
      @subscription_payment = SubscriptionPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_payment_params
      params.require(:subscription_payment).permit(:subscription_payment_id, :subscription_id, :amount_paid, :date_paid, :good_till, :paypal, :notes)
    end
end
