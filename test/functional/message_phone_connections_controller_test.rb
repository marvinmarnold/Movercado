require 'test_helper'

class MessagePhoneConnectionsControllerTest < ActionController::TestCase
  setup do
    @message_phone_connection = message_phone_connections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:message_phone_connections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message_phone_connection" do
    assert_difference('MessagePhoneConnection.count') do
      post :create, message_phone_connection: @message_phone_connection.attributes
    end

    assert_redirected_to message_phone_connection_path(assigns(:message_phone_connection))
  end

  test "should show message_phone_connection" do
    get :show, id: @message_phone_connection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message_phone_connection
    assert_response :success
  end

  test "should update message_phone_connection" do
    put :update, id: @message_phone_connection, message_phone_connection: @message_phone_connection.attributes
    assert_redirected_to message_phone_connection_path(assigns(:message_phone_connection))
  end

  test "should destroy message_phone_connection" do
    assert_difference('MessagePhoneConnection.count', -1) do
      delete :destroy, id: @message_phone_connection
    end

    assert_redirected_to message_phone_connections_path
  end
end
