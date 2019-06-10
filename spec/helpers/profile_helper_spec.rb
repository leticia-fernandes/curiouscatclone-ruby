require 'rails_helper'

RSpec.describe ProfileHelper, type: :helper do
  describe '#like_form_options' do
    let! (:user) { create(:random_user) }
    let! (:answer) { create(:answer) }

    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    context 'When the answer was liked by the logged user' do
      let! (:like) { create(:like, user: user, answer: answer) }
      let! (:response) { helper.like_form_options(answer) }
      it 'returns the like form options with DELETE method' do
        expect(response[:like]).to eq(like)
        expect(response[:answer]).to eq(answer)
        expect(response[:method_form]).to eq(:delete)
        expect(response[:button_class]).to eq('btn-like-red')
      end
    end

    context 'When the answer wasn\'t liked by the logged user' do
      let! (:response) { helper.like_form_options(answer) }
      it 'returns the like form options with POST method' do
        expect(response[:like]).to be_a_new Like
        expect(response[:answer]).to eq(answer)
        expect(response[:method_form]).to eq(:post)
        expect(response[:button_class]).to eq('btn-like-gray')
      end
    end
  end
end
