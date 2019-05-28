require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @sender = create(:random_user)
    @addressee = create(:random_user)
  end

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

  context 'get user answered questions' do
    before do
      @question = create(:question, sender: @sender, addressee: @addressee)
    end

    context 'when have at least one answered question' do
      before do
        create(:answer, question: @question)
      end

      it 'returns a full relation' do
        expect(@addressee.answered_questions).to_not be_empty
      end
    end

    context 'when there\'s not a answered question' do
      it 'returns an empty relation' do
        expect(@addressee.answered_questions).to be_empty
      end
    end
  end

  context 'get user unanswered questions' do
    context 'when have at least one unanswered question' do
      before do
        @question = create(:question, sender: @sender, addressee: @addressee)
      end

      it 'returns a full relation' do
        expect(@addressee.unanswered_questions).to_not be_empty
      end
    end

    context 'when there\'s not a unanswered question' do
      it 'returns an empty relation' do
        expect(@addressee.unanswered_questions).to be_empty
      end
    end
  end
end
