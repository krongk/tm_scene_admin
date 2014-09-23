require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  setup do
    @site = sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site" do
    assert_difference('Site.count') do
      post :create, site: { description: @site.description, html: @site.html, is_private: @site.is_private, key: @site.key, preview_image: @site.preview_image, private_password: @site.private_password, status: @site.status, template_id: @site.template_id, title: @site.title }
    end

    assert_redirected_to site_path(assigns(:site))
  end

  test "should show site" do
    get :show, id: @site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site
    assert_response :success
  end

  test "should update site" do
    patch :update, id: @site, site: { description: @site.description, html: @site.html, is_private: @site.is_private, key: @site.key, preview_image: @site.preview_image, private_password: @site.private_password, status: @site.status, template_id: @site.template_id, title: @site.title }
    assert_redirected_to site_path(assigns(:site))
  end

  test "should destroy site" do
    assert_difference('Site.count', -1) do
      delete :destroy, id: @site
    end

    assert_redirected_to sites_path
  end
end
