require 'test_helper'

class AbductedsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get '/api/v1/abducted'
    assert_response :success
  end

end
