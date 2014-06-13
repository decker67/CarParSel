require 'test_helper'

class ModelTypesControllerTest < ActionController::TestCase
  setup do
    @model_type = model_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:model_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model_type" do
    assert_difference('ModelType.count') do
      post :create, model_type: { brand_model_id: @model_type.brand_model_id, month_of_construction_period_from: @model_type.month_of_construction_period_from, type: @model_type.type, year_of_construction_period_from: @model_type.year_of_construction_period_from, year_of_construction_period_from: @model_type.year_of_construction_period_from, year_of_construction_period_to: @model_type.year_of_construction_period_to }
    end

    assert_redirected_to model_type_path(assigns(:model_type))
  end

  test "should show model_type" do
    get :show, id: @model_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model_type
    assert_response :success
  end

  test "should update model_type" do
    patch :update, id: @model_type, model_type: { brand_model_id: @model_type.brand_model_id, month_of_construction_period_from: @model_type.month_of_construction_period_from, type: @model_type.type, year_of_construction_period_from: @model_type.year_of_construction_period_from, year_of_construction_period_from: @model_type.year_of_construction_period_from, year_of_construction_period_to: @model_type.year_of_construction_period_to }
    assert_redirected_to model_type_path(assigns(:model_type))
  end

  test "should destroy model_type" do
    assert_difference('ModelType.count', -1) do
      delete :destroy, id: @model_type
    end

    assert_redirected_to model_types_path
  end
end
