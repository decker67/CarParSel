require 'test_helper'

class CarPartsControllerTest < ActionController::TestCase
  setup do
    @car_part = car_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:car_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create car_part" do
    assert_difference('CarPart.count') do
      post :create, car_part: { car_id: @car_part.car_id, description: @car_part.description, ebay_article_number: @car_part.ebay_article_number, ebay_selling_type: @car_part.ebay_selling_type, picture_url0: @car_part.picture_url0, picture_url1: @car_part.picture_url1, picture_url2: @car_part.picture_url2, picture_url3: @car_part.picture_url3, picture_url4: @car_part.picture_url4, picture_url5: @car_part.picture_url5, picture_url6: @car_part.picture_url6, postage_austria: @car_part.postage_austria, postage_europe_with_eu: @car_part.postage_europe_with_eu, postage_europe_without_eu: @car_part.postage_europe_without_eu, postage_germany: @car_part.postage_germany, postage_swiss: @car_part.postage_swiss, postage_world_wide: @car_part.postage_world_wide, price: @car_part.price }
    end

    assert_redirected_to car_part_path(assigns(:car_part))
  end

  test "should show car_part" do
    get :show, id: @car_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @car_part
    assert_response :success
  end

  test "should update car_part" do
    patch :update, id: @car_part, car_part: { car_id: @car_part.car_id, description: @car_part.description, ebay_article_number: @car_part.ebay_article_number, ebay_selling_type: @car_part.ebay_selling_type, picture_url0: @car_part.picture_url0, picture_url1: @car_part.picture_url1, picture_url2: @car_part.picture_url2, picture_url3: @car_part.picture_url3, picture_url4: @car_part.picture_url4, picture_url5: @car_part.picture_url5, picture_url6: @car_part.picture_url6, postage_austria: @car_part.postage_austria, postage_europe_with_eu: @car_part.postage_europe_with_eu, postage_europe_without_eu: @car_part.postage_europe_without_eu, postage_germany: @car_part.postage_germany, postage_swiss: @car_part.postage_swiss, postage_world_wide: @car_part.postage_world_wide, price: @car_part.price }
    assert_redirected_to car_part_path(assigns(:car_part))
  end

  test "should destroy car_part" do
    assert_difference('CarPart.count', -1) do
      delete :destroy, id: @car_part
    end

    assert_redirected_to car_parts_path
  end
end
