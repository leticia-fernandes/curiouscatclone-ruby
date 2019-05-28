require 'rails_helper'

RSpec.describe Question, type: :model do

  it "is valid with valid attributes" do
    question = build(:question)
    expect(question).to be_valid
  end

  it "is not valid without the question content" do
    question = build(:question, content: nil)
    expect(question).to_not be_valid
    expect(question.errors.messages[:content]).to eq ["can't be blank"]
  end

  it "is not valid without a sender" do
    question = build(:question, sender_id: nil)
    expect(question).to_not be_valid
    expect(question.errors.messages[:sender]).to eq ["must exist", "can't be blank"]
  end

  it "is not valid without a addressee" do
    question = build(:question, addressee_id: nil)
    expect(question).to_not be_valid
    expect(question.errors.messages[:addressee]).to eq ["must exist", "can't be blank"]
  end

end
