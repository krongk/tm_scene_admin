require 'test_helper'

class PaymentTokensControllerTest < ActionController::TestCase
  setup do
    @payment_token = payment_tokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_token" do
    assert_difference('PaymentToken.count') do
      post :create, payment_token: { actived_by: @payment_token.actived_by, actived_site_id: @payment_token.actived_site_id, code: @payment_token.code, note: @payment_token.note, status: @payment_token.status, user_id: @payment_token.user_id }
    end

    assert_redirected_to payment_token_path(assigns(:payment_token))
  end

  test "should show payment_token" do
    get :show, id: @payment_token
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_token
    assert_response :success
  end

  test "should update payment_token" do
    patch :update, id: @payment_token, payment_token: { actived_by: @payment_token.actived_by, actived_site_id: @payment_token.actived_site_id, code: @payment_token.code, note: @payment_token.note, status: @payment_token.status, user_id: @payment_token.user_id }
    assert_redirected_to payment_token_path(assigns(:payment_token))
  end

  test "should destroy payment_token" do
    assert_difference('PaymentToken.count', -1) do
      delete :destroy, id: @payment_token
    end

    assert_redirected_to payment_tokens_path
  end
end
