require "rails_helper"

RSpec.describe User, :type => :model do

  context "unique validation" do
    before do
      create(:user)
    end

    it "has a unique username" do
      user2 = build(:user, email: "bob@gmail.com")
      expect(user2).to_not be_valid
      expect(user2.errors.messages[:username]).to eq ['has already been taken']
    end

    it "has a unique email" do
      user2 = build(:user, username: "Bob")
      expect(user2).to_not be_valid
      expect(user2.errors.messages[:email]).to eq ['has already been taken']
    end
  end

  it "is valid with valid attributes" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
    expect(user.errors.messages[:password]).to eq ["can't be blank"]
  end

  it "is not valid without a username" do
    user = build(:user, username: nil)
    expect(user).to_not be_valid
    expect(user.errors.messages[:username]).to eq ["can't be blank"]
  end

  it "is not valid without an email" do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
    expect(user.errors.messages[:email]).to eq ["can't be blank"]
  end

  it "is not valid without a name" do
    user = build(:user, name: nil)
    expect(user).to_not be_valid
    expect(user.errors.messages[:name]).to eq ["can't be blank"]
  end

end
