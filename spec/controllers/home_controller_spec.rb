require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it { is_expected.to_not use_before_action(:authenticate_user!) }

    context 'when not logged in' do
      before { get :index }
      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template('index') }
    end

    context 'when logged' do
      login_user
      before { get :index }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(me_path) }
    end
  end
end
