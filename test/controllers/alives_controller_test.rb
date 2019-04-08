require 'test_helper'

class AlivesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get '/api/v1/alive', as: :json
    assert_response :success

  end

  test "should create abducted alert" do
    assert_difference('AbductedUser.count') do
      post '/api/v1/alive', params: {
          id_user: '298486374',
          id_target: '980190962'
      }
    end

    assert_response 201
  end


end
