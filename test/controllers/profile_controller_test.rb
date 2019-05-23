require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    user = create(:user)
    sign_in user
  end

  test "logged in should get profile#index" do
    get '/'
    assert_response :success
    assert_match /Profile/ , @response.body
  end

end
