require 'test_helper'

class IpsumControllerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get get_ipsum" do
    get :get_ipsum
    assert_response :success
  end

end
