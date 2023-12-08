require "test_helper"

class AuthomorphNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should not calculate without login" do
    get authomorph_numbers_view_url + '.json', params: { n: 1 }
    assert_response 401
  end
end
