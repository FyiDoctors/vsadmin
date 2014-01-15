require 'test_helper'

class MembershipFeesControllerTest < ActionController::TestCase
  setup do
    @membership_fee = membership_fees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membership_fees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membership_fee" do
    assert_difference('MembershipFee.count') do
      post :create, membership_fee: { checknumber: @membership_fee.checknumber, creditcard: @membership_fee.creditcard, month: @membership_fee.month, receipts: @membership_fee.receipts, refunds: @membership_fee.refunds, tax: @membership_fee.tax }
    end

    assert_redirected_to membership_fee_path(assigns(:membership_fee))
  end

  test "should show membership_fee" do
    get :show, id: @membership_fee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membership_fee
    assert_response :success
  end

  test "should update membership_fee" do
    patch :update, id: @membership_fee, membership_fee: { checknumber: @membership_fee.checknumber, creditcard: @membership_fee.creditcard, month: @membership_fee.month, receipts: @membership_fee.receipts, refunds: @membership_fee.refunds, tax: @membership_fee.tax }
    assert_redirected_to membership_fee_path(assigns(:membership_fee))
  end

  test "should destroy membership_fee" do
    assert_difference('MembershipFee.count', -1) do
      delete :destroy, id: @membership_fee
    end

    assert_redirected_to membership_fees_path
  end
end
