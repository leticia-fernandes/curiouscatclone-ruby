require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  fixtures :users
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "logged in should get profile#index" do
    get '/'
    assert_response :success
    assert_match /Profile/ , @response.body
  end

end
