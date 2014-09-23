require 'test_helper'

class KeystoresControllerTest < ActionController::TestCase
  setup do
    @keystore = keystores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keystores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keystore" do
    assert_difference('Keystore.count') do
      post :create, keystore: { key: @keystore.key, obj_id: @keystore.obj_id, obj_type: @keystore.obj_type, value: @keystore.value }
    end

    assert_redirected_to keystore_path(assigns(:keystore))
  end

  test "should show keystore" do
    get :show, id: @keystore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keystore
    assert_response :success
  end

  test "should update keystore" do
    patch :update, id: @keystore, keystore: { key: @keystore.key, obj_id: @keystore.obj_id, obj_type: @keystore.obj_type, value: @keystore.value }
    assert_redirected_to keystore_path(assigns(:keystore))
  end

  test "should destroy keystore" do
    assert_difference('Keystore.count', -1) do
      delete :destroy, id: @keystore
    end

    assert_redirected_to keystores_path
  end
end
