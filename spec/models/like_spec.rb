require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Factory' do
    it 'is valid with valid attributes' do
      like = build(:like)
      expect(like).to be_valid
    end
  end

  describe 'Relations' do
    it { is_expected.to belong_to(:answer) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:addressee) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:answer_id) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
