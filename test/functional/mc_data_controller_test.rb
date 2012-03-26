require 'test_helper'

class McDataControllerTest < ActionController::TestCase
  setup do
    @mc_datum = mc_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mc_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mc_datum" do
    assert_difference('McDatum.count') do
      post :create, mc_datum: @mc_datum.attributes
    end

    assert_redirected_to mc_datum_path(assigns(:mc_datum))
  end

  test "should show mc_datum" do
    get :show, id: @mc_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mc_datum
    assert_response :success
  end

  test "should update mc_datum" do
    put :update, id: @mc_datum, mc_datum: @mc_datum.attributes
    assert_redirected_to mc_datum_path(assigns(:mc_datum))
  end

  test "should destroy mc_datum" do
    assert_difference('McDatum.count', -1) do
      delete :destroy, id: @mc_datum
    end

    assert_redirected_to mc_data_path
  end
end
