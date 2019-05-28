require 'rails_helper'

RSpec.describe Answer, type: :model do
  it 'is valid with valid attributes' do
    answer = build(:answer)
    expect(answer).to be_valid
  end

  it 'is not valid without the answer content' do
    answer = build(:answer, content: nil)
    expect(answer).to_not be_valid
    expect(answer.errors.messages[:content]).to eq ['can\'t be blank']
  end

  it 'is not valid without a question' do
    answer = build(:answer, question_id: nil)
    expect(answer).to_not be_valid
    expect(answer.errors.messages[:question_id]).to eq ['can\'t be blank']
  end
end
