require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe 'GET #received_questions' do
    login_user
    it { is_expected.to use_before_action(:authenticate_user!) }

    before { get :received_questions }
    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template('received_questions') }
  end

  describe 'GET #create' do
    login_user
    it { is_expected.to use_before_action(:authenticate_user!) }

    let! (:question) { build(:question) }
    before { get :create, params: { question: { content: question.content, sender_id: question.sender_id, addressee_id: question.addressee_id, anonymous: question.anonymous } } }

    it { is_expected.to respond_with(302) }
    it { is_expected.to redirect_to(profile_show_path(username: question.addressee.username)) }
  end
end
