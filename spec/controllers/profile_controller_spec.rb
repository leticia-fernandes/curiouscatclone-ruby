require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe 'GET #index' do
    context 'when logged' do
      login_user
      it 'returns HTTP status 200' do
        get :me
        expect(response).to be_successful
      end
    end

    context 'when not logged in' do
      it 'redirects to login page' do
        get :me
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'get #show' do
    context 'when logged' do
      login_user

      context 'if the user it\'s found' do
        before do
          create(:user, username: 'mariasousa', email: 'mariasousa@mail.com')
        end

        it 'returns HTTP status 200' do
          get :show, params: { username: 'mariasousa' }
          expect(response).to have_http_status(200)
        end
        it 'renders show template' do
          get :show, params: { username: 'mariasousa' }
          expect(response).to render_template('show')
        end
      end

      context 'if the user it`s not found' do
        it 'renders 404 template' do
          get :show, params: { username: 'x' }
          expect(response).to render_template('public/404.html.erb')
        end
        it 'returns HTTP status 404' do
          get :show, params: { username: 'x' }
          expect(response).to have_http_status(404)
        end
      end
    end

    context 'when not logged in' do
      it 'redirects to login page' do
        get :show, params: { username: 'username' }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
