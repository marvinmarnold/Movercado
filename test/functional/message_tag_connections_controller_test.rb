require 'test_helper'

class MessageTagConnectionsControllerTest < ActionController::TestCase
  setup do
    @message_tag_connection = message_tag_connections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:message_tag_connections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message_tag_connection" do
    assert_difference('MessageTagConnection.count') do
      post :create, message_tag_connection: @message_tag_connection.attributes
    end

    assert_redirected_to message_tag_connection_path(assigns(:message_tag_connection))
  end

  test "should show message_tag_connection" do
    get :show, id: @message_tag_connection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message_tag_connection
    assert_response :success
  end

  test "should update message_tag_connection" do
    put :update, id: @message_tag_connection, message_tag_connection: @message_tag_connection.attributes
    assert_redirected_to message_tag_connection_path(assigns(:message_tag_connection))
  end

  test "should destroy message_tag_connection" do
    assert_difference('MessageTagConnection.count', -1) do
      delete :destroy, id: @message_tag_connection
    end

    assert_redirected_to message_tag_connections_path
  end
end
