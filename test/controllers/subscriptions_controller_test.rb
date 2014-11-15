require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  setup do
    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription" do
    assert_difference('Subscription.count') do
      post :create, subscription: { alternative_invoice: @subscription.alternative_invoice, city: @subscription.city, email: @subscription.email, first_name: @subscription.first_name, last_letter_sent_date: @subscription.last_letter_sent_date, last_name: @subscription.last_name, maint: @subscription.maint, map_date: @subscription.map_date, number: @subscription.number, phone_number: @subscription.phone_number, qty: @subscription.qty, qty_comp: @subscription.qty_comp, renewal_due_date: @subscription.renewal_due_date, renewal_x0020_grp: @subscription.renewal_x0020_grp, route_id: @subscription.route_id, run_sequence: @subscription.run_sequence, service_notes: @subscription.service_notes, sold_x0020_By: @subscription.sold_x0020_By, started_date: @subscription.started_date, state: @subscription.state, street: @subscription.street, subscription_amount: @subscription.subscription_amount, subscription_id: @subscription.subscription_id, subscription_notes: @subscription.subscription_notes, subscription_status: @subscription.subscription_status, zip: @subscription.zip }
    end

    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should show subscription" do
    get :show, id: @subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription
    assert_response :success
  end

  test "should update subscription" do
    patch :update, id: @subscription, subscription: { alternative_invoice: @subscription.alternative_invoice, city: @subscription.city, email: @subscription.email, first_name: @subscription.first_name, last_letter_sent_date: @subscription.last_letter_sent_date, last_name: @subscription.last_name, maint: @subscription.maint, map_date: @subscription.map_date, number: @subscription.number, phone_number: @subscription.phone_number, qty: @subscription.qty, qty_comp: @subscription.qty_comp, renewal_due_date: @subscription.renewal_due_date, renewal_x0020_grp: @subscription.renewal_x0020_grp, route_id: @subscription.route_id, run_sequence: @subscription.run_sequence, service_notes: @subscription.service_notes, sold_x0020_By: @subscription.sold_x0020_By, started_date: @subscription.started_date, state: @subscription.state, street: @subscription.street, subscription_amount: @subscription.subscription_amount, subscription_id: @subscription.subscription_id, subscription_notes: @subscription.subscription_notes, subscription_status: @subscription.subscription_status, zip: @subscription.zip }
    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should destroy subscription" do
    assert_difference('Subscription.count', -1) do
      delete :destroy, id: @subscription
    end

    assert_redirected_to subscriptions_path
  end
end
