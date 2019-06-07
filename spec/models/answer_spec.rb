require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'Factory' do
    it 'is valid with valid attributes' do
      answer = build(:answer)
      expect(answer).to be_valid
    end
  end

  describe 'Relations' do
    it { is_expected.to belong_to(:question) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_one(:addressee) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:question_id) }
  end
end
