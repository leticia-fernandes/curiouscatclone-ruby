require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Factory' do
    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe 'Relations' do
    it { is_expected.to have_many(:submitted_questions) }
    it { is_expected.to have_many(:received_questions) }
    it { is_expected.to have_many(:likes) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
