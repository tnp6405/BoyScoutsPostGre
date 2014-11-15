require 'test_helper'

class RunsControllerTest < ActionController::TestCase
  setup do
    @run = runs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create run" do
    assert_difference('Run.count') do
      post :create, run: { am_pm: @run.am_pm, member_id: @run.member_id, notes: @run.notes, route_id: @run.route_id, run_date: @run.run_date, run_id: @run.run_id, time_taken: @run.time_taken }
    end

    assert_redirected_to run_path(assigns(:run))
  end

  test "should show run" do
    get :show, id: @run
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @run
    assert_response :success
  end

  test "should update run" do
    patch :update, id: @run, run: { am_pm: @run.am_pm, member_id: @run.member_id, notes: @run.notes, route_id: @run.route_id, run_date: @run.run_date, run_id: @run.run_id, time_taken: @run.time_taken }
    assert_redirected_to run_path(assigns(:run))
  end

  test "should destroy run" do
    assert_difference('Run.count', -1) do
      delete :destroy, id: @run
    end

    assert_redirected_to runs_path
  end
end
