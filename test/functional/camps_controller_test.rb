require 'test_helper'

class CampsControllerTest < ActionController::TestCase
  setup do
    @camp = camps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camp" do
    assert_difference('Camp.count') do
      post :create, :camp => @camp.attributes
    end

    assert_redirected_to camp_path(assigns(:camp))
  end

  test "should show camp" do
    get :show, :id => @camp.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @camp.to_param
    assert_response :success
  end

  test "should update camp" do
    put :update, :id => @camp.to_param, :camp => @camp.attributes
    assert_redirected_to camp_path(assigns(:camp))
  end

  test "should destroy camp" do
    assert_difference('Camp.count', -1) do
      delete :destroy, :id => @camp.to_param
    end

    assert_redirected_to camps_path
  end
end
