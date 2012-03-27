require 'test_helper'

class SalesDataControllerTest < ActionController::TestCase
  setup do
    @sales_datum = sales_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_datum" do
    assert_difference('SalesDatum.count') do
      post :create, sales_datum: @sales_datum.attributes
    end

    assert_redirected_to sales_datum_path(assigns(:sales_datum))
  end

  test "should show sales_datum" do
    get :show, id: @sales_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_datum
    assert_response :success
  end

  test "should update sales_datum" do
    put :update, id: @sales_datum, sales_datum: @sales_datum.attributes
    assert_redirected_to sales_datum_path(assigns(:sales_datum))
  end

  test "should destroy sales_datum" do
    assert_difference('SalesDatum.count', -1) do
      delete :destroy, id: @sales_datum
    end

    assert_redirected_to sales_data_path
  end
end
