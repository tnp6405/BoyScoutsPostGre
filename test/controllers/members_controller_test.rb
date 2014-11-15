require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: { memberInactive: @member.memberInactive, member_cell: @member.member_cell, member_email: @member.member_email, member_first_name: @member.member_first_name, member_id: @member.member_id, member_landline: @member.member_landline, member_last_name: @member.member_last_name, member_vehicle: @member.member_vehicle }
    end

    assert_redirected_to member_path(assigns(:member))
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    patch :update, id: @member, member: { memberInactive: @member.memberInactive, member_cell: @member.member_cell, member_email: @member.member_email, member_first_name: @member.member_first_name, member_id: @member.member_id, member_landline: @member.member_landline, member_last_name: @member.member_last_name, member_vehicle: @member.member_vehicle }
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end
