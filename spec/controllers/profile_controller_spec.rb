require 'rails_helper'

RSpec.describe ProfileController, type: :controller do
  let! (:user) { create(:random_user) }

  describe 'GET #me' do
    login_user
    it { should use_before_action(:authenticate_user!) }

    before { get :me }
    it { is_expected.to respond_with(200) }
  end

  describe 'GET #show' do
    login_user
    it { should use_before_action(:authenticate_user!) }

    context 'when the user it\'s found' do
      before { post :show, params: { username: user.username } }
      it { is_expected.to respond_with(200) }
    end

    context 'when the user it\'s not found' do
      before { post :show, params: { username: 'xyzasas' } }
      it { is_expected.to respond_with(404) }
      it { is_expected.to render_template('public/404.html.erb') }
    end
  end

  describe 'GET #search' do
    login_user
    it { should use_before_action(:authenticate_user!) }

    before { get :search }
    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template('explore') }

    context 'when passing a username to search' do
      context 'when the user it\'s found' do
        it 'returns a list of match user(s)' do
          get :search, params: { username: user.username }
          expect(assigns(:users)).to eq([user])
        end
        it { is_expected.to render_template('explore') }
      end

      context 'when the user it\'s not found' do
        it 'returns a message saying \'Nothing found\' ' do
          get :search, params: { username: 'usernamex' }
          expect(assigns(:message)).to eq('Nothing found')
        end
        it { is_expected.to render_template('explore') }
      end
    end

    context 'when not passing a username to search'  do
      it 'returns a message saying \'Type username to search\' ' do
        get :search, params: { username: '' }
        expect(assigns(:message)).to eq('Type username to search')
      end
      it { is_expected.to render_template('explore') }
    end
  end
end
