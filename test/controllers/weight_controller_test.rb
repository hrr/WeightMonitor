require 'test_helper'

class WeightControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get weight_create_url
    assert_response :success
  end

  test "should get destroy" do
    get weight_destroy_url
    assert_response :success
  end

end
