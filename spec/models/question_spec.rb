require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'Factory' do
    it 'is valid with valid attributes' do
      question = build(:question)
      expect(question).to be_valid
    end
  end

  describe 'Relations' do
    it { is_expected.to belong_to(:sender) }
    it { is_expected.to belong_to(:addressee) }
    it { is_expected.to have_one(:answer) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:sender_id) }
    it { is_expected.to validate_presence_of(:addressee_id) }
  end

  describe 'Instance methods' do
    let!(:addressee) { create(:random_user) }

    describe '#answered' do
      let!(:question) { create(:question, addressee: addressee) }

      context 'when have at least one answered question' do
        let!(:answer) { create(:answer, question: question) }

        it 'returns a full relation' do
          expect(addressee.answered_questions).to_not be_empty
        end

        it 'returns only answered_questions' do
          create(:question, addressee: addressee)
          expect(addressee.answered_questions).to eq([question])
        end
      end

      context 'when there\'s not a answered question' do
        it 'returns an empty relation' do
          expect(addressee.answered_questions).to be_empty
        end
      end
    end

    describe '#unanswered' do
      context 'when have at least one unanswered question' do
        let!(:question) { create(:question, addressee: addressee) }
        it 'returns a full relation' do
          expect(addressee.unanswered_questions).to_not be_empty
        end
      end

      context 'when there\'s not a unanswered question' do
        it 'returns an empty relation' do
          expect(addressee.unanswered_questions).to be_empty
        end
      end
    end
  end
end
