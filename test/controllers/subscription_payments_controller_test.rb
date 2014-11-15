require 'test_helper'

class SubscriptionPaymentsControllerTest < ActionController::TestCase
  setup do
    @subscription_payment = subscription_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscription_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription_payment" do
    assert_difference('SubscriptionPayment.count') do
      post :create, subscription_payment: { amount_paid: @subscription_payment.amount_paid, date_paid: @subscription_payment.date_paid, good_till: @subscription_payment.good_till, notes: @subscription_payment.notes, paypal: @subscription_payment.paypal, subscription_id: @subscription_payment.subscription_id, subscription_payment_id: @subscription_payment.subscription_payment_id }
    end

    assert_redirected_to subscription_payment_path(assigns(:subscription_payment))
  end

  test "should show subscription_payment" do
    get :show, id: @subscription_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription_payment
    assert_response :success
  end

  test "should update subscription_payment" do
    patch :update, id: @subscription_payment, subscription_payment: { amount_paid: @subscription_payment.amount_paid, date_paid: @subscription_payment.date_paid, good_till: @subscription_payment.good_till, notes: @subscription_payment.notes, paypal: @subscription_payment.paypal, subscription_id: @subscription_payment.subscription_id, subscription_payment_id: @subscription_payment.subscription_payment_id }
    assert_redirected_to subscription_payment_path(assigns(:subscription_payment))
  end

  test "should destroy subscription_payment" do
    assert_difference('SubscriptionPayment.count', -1) do
      delete :destroy, id: @subscription_payment
    end

    assert_redirected_to subscription_payments_path
  end
end
