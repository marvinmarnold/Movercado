require 'test_helper'

class AppVarsControllerTest < ActionController::TestCase
  setup do
    @app_var = app_vars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_vars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_var" do
    assert_difference('AppVar.count') do
      post :create, app_var: @app_var.attributes
    end

    assert_redirected_to app_var_path(assigns(:app_var))
  end

  test "should show app_var" do
    get :show, id: @app_var
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_var
    assert_response :success
  end

  test "should update app_var" do
    put :update, id: @app_var, app_var: @app_var.attributes
    assert_redirected_to app_var_path(assigns(:app_var))
  end

  test "should destroy app_var" do
    assert_difference('AppVar.count', -1) do
      delete :destroy, id: @app_var
    end

    assert_redirected_to app_vars_path
  end
end
