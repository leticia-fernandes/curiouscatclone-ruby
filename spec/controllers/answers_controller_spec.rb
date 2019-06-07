require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  describe 'GET #create' do
    login_user
    it { is_expected.to use_before_action(:authenticate_user!) }

    let! (:answer) { build(:answer) }
    before { get :create, params: { answer: { content: answer.content, question_id: answer.question_id } } }

    it { is_expected.to respond_with(302) }
    it { is_expected.to redirect_to(received_questions_path) }
  end
end
