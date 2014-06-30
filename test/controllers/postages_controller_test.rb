require 'test_helper'

class PostagesControllerTest < ActionController::TestCase
  setup do
    @postage = postages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postage" do
    assert_difference('Postage.count') do
      post :create, postage: { name: @postage.name }
    end

    assert_redirected_to postage_path(assigns(:postage))
  end

  test "should show postage" do
    get :show, id: @postage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postage
    assert_response :success
  end

  test "should update postage" do
    patch :update, id: @postage, postage: { name: @postage.name }
    assert_redirected_to postage_path(assigns(:postage))
  end

  test "should destroy postage" do
    assert_difference('Postage.count', -1) do
      delete :destroy, id: @postage
    end

    assert_redirected_to postages_path
  end
end
