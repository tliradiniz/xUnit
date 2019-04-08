require 'test_helper'

class SurvivorsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get '/api/v1/survivors', as: :json
    assert_response :success
  end

  test "should create survivor" do
    assert_difference('Survivor.count') do
      post '/api/v1/survivors', params: {
          name: 'Carla',
          age: 33,
          gender: 'Feminino',
          last_location: '20, 50'
      }
    end

    assert_response 201
  end

  test "should create second survivor" do
    assert_difference('Survivor.count') do
      post '/api/v1/survivors', params: {
          name: 'Marcio',
          age: 45,
          gender: 'Masculino',
          last_location: '80, 120'
      }

    end

    assert_response 201
  end

  test "should show survivor" do
    get '/api/v1/survivors/980190962'
    assert_response :success
  end

  test "should update survivor" do
    patch '/api/v1/survivors/980190962', params: {last_location: '0, 0'}
    assert_response 200
  end

end
