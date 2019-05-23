require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    first_user = create(:user)
  end

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:username].any?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
  end

  test "user is not valid without a unique username" do
    user = build(:user, email: 'anotherjohn@mail.com');

    assert user.invalid?
    assert_equal ["has already been taken"], user.errors[:username]
  end

  test "user is not valid without a unique email" do
    user = build(:user, username: 'anotherjohn');

    assert user.invalid?
    assert_equal ["has already been taken"], user.errors[:email]
  end
end
