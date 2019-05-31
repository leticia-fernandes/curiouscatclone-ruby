require 'rails_helper'

RSpec.describe Like, type: :model do

  it 'is valid with valid attributes' do
    like = build(:like)
    expect(like).to be_valid
  end

  it 'is not valid without an answer' do
    like = build(:like, answer_id: nil)
    expect(like).to_not be_valid
    expect(like.errors.messages[:answer_id]).to eq ['can\'t be blank']
  end

  it 'is not valid without an user' do
    like = build(:like, user_id: nil)
    expect(like).to_not be_valid
    expect(like.errors.messages[:user_id]).to eq ['can\'t be blank']
  end

end
