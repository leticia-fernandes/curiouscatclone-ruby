require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'GET #index' do
    context 'when not logged in' do
      it 'returns HTTP status 200' do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    context 'when logged' do
      login_user
      it 'redirects to user profile page' do
        get :index
        expect(response).to redirect_to(me_path)
      end
    end
  end

end
