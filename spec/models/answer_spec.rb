require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "is valid with valid attributes" do
    answer = build(:answer)
    expect(answer).to be_valid
    expect(answer.errors.messages).to be_empty
  end

  it "is not valid without an answer" do
    answer = build(:answer, answer: nil)
    expect(answer).to_not be_valid
    expect(answer.errors.messages[:answer]).to eq ["can't be blank"]
  end

  it "is not valid without a question" do
    answer = build(:answer, question_id: nil)
    expect(answer).to_not be_valid
    expect(answer.errors.messages[:question]).to eq ["must exist", "can't be blank"]
  end
end
