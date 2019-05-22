require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:username].any?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
  end

  test "user encrypted_password length must be at least 6 characters" do
    user = User.new(name: "Name #{rand(100)}",
                    username: "username#{rand 100}",
                    email: "email#{rand 100}@mail.com",
                    password: "123")

    assert user.invalid?
    assert_equal ["is too short (minimum is 6 characters)"], user.errors[:password]

    user.password = '1234567'
    assert user.valid?
  end

  test "user is not valid without a unique username" do
    user = User.new(name: users(:one).name,
                    username: users(:one).username,
                    email: "email#{rand 100}@mail.com",
                    password: "1234567")

    assert user.invalid?
    assert_equal ["has already been taken"], user.errors[:username]
  end

  test "user is not valid without a unique email" do
    user = User.new(name: users(:one).name,
                    username: "username#{rand 100}",
                    email: users(:one).email,
                    password: "1234567")

    assert user.invalid?
    assert_equal ["has already been taken"], user.errors[:email]
  end
end
