require 'rails_helper'

RSpec.describe Question, type: :model do

  it 'is valid with valid attributes' do
    question = build(:question)
    expect(question).to be_valid
  end

  it 'is not valid without the question content' do
    question = build(:question, content: nil)
    expect(question).to_not be_valid
    expect(question.errors.messages[:content]).to eq ['can\'t be blank']
  end

  it 'is not valid without a sender' do
    question = build(:question, sender_id: nil)
    expect(question).to_not be_valid
    expect(question.errors.messages[:sender_id]).to eq ['can\'t be blank']
  end

  it 'is not valid without a addressee' do
    question = build(:question, addressee_id: nil)
    expect(question).to_not be_valid
    expect(question.errors.messages[:addressee_id]).to eq ['can\'t be blank']
  end

  describe 'instance methods' do
    let!(:addressee) { create(:random_user) }

    context 'get user answered questions' do
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

    context 'get user unanswered questions' do
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
