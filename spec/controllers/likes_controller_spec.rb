require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe 'GET #create' do
    login_user
    it { is_expected.to use_before_action(:authenticate_user!) }

    let! (:like) { build(:like) }
    before { get :create, params: { like: { answer_id: like.answer_id } } }

    it { is_expected.to respond_with(302) }
    it { is_expected.to redirect_to(profile_show_path(like.addressee.username)) }
  end
end
