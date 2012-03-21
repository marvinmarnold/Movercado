require 'test_helper'

class UserAppVarsControllerTest < ActionController::TestCase
  setup do
    @user_app_var = user_app_vars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_app_vars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_app_var" do
    assert_difference('UserAppVar.count') do
      post :create, user_app_var: @user_app_var.attributes
    end

    assert_redirected_to user_app_var_path(assigns(:user_app_var))
  end

  test "should show user_app_var" do
    get :show, id: @user_app_var
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_app_var
    assert_response :success
  end

  test "should update user_app_var" do
    put :update, id: @user_app_var, user_app_var: @user_app_var.attributes
    assert_redirected_to user_app_var_path(assigns(:user_app_var))
  end

  test "should destroy user_app_var" do
    assert_difference('UserAppVar.count', -1) do
      delete :destroy, id: @user_app_var
    end

    assert_redirected_to user_app_vars_path
  end
end
