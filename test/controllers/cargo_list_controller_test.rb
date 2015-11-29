require 'test_helper'

class CargoListControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
