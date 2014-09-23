require 'test_helper'

class PaymentCouponsControllerTest < ActionController::TestCase
  setup do
    @payment_coupon = payment_coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_coupons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_coupon" do
    assert_difference('PaymentCoupon.count') do
      post :create, payment_coupon: { actived_by: @payment_coupon.actived_by, actived_site_id: @payment_coupon.actived_site_id, code: @payment_coupon.code, message: @payment_coupon.message, note: @payment_coupon.note, price: @payment_coupon.price, status: @payment_coupon.status, user_id: @payment_coupon.user_id }
    end

    assert_redirected_to payment_coupon_path(assigns(:payment_coupon))
  end

  test "should show payment_coupon" do
    get :show, id: @payment_coupon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_coupon
    assert_response :success
  end

  test "should update payment_coupon" do
    patch :update, id: @payment_coupon, payment_coupon: { actived_by: @payment_coupon.actived_by, actived_site_id: @payment_coupon.actived_site_id, code: @payment_coupon.code, message: @payment_coupon.message, note: @payment_coupon.note, price: @payment_coupon.price, status: @payment_coupon.status, user_id: @payment_coupon.user_id }
    assert_redirected_to payment_coupon_path(assigns(:payment_coupon))
  end

  test "should destroy payment_coupon" do
    assert_difference('PaymentCoupon.count', -1) do
      delete :destroy, id: @payment_coupon
    end

    assert_redirected_to payment_coupons_path
  end
end
