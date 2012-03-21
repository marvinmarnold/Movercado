require 'test_helper'

class ActorCodesControllerTest < ActionController::TestCase
  setup do
    @actor_code = actor_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actor_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actor_code" do
    assert_difference('ActorCode.count') do
      post :create, actor_code: @actor_code.attributes
    end

    assert_redirected_to actor_code_path(assigns(:actor_code))
  end

  test "should show actor_code" do
    get :show, id: @actor_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actor_code
    assert_response :success
  end

  test "should update actor_code" do
    put :update, id: @actor_code, actor_code: @actor_code.attributes
    assert_redirected_to actor_code_path(assigns(:actor_code))
  end

  test "should destroy actor_code" do
    assert_difference('ActorCode.count', -1) do
      delete :destroy, id: @actor_code
    end

    assert_redirected_to actor_codes_path
  end
end
