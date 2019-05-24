require "rails_helper"

RSpec.describe ProfileController, :type => :controller do

  describe "GET #index" do
    context "when logged" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = create(:user)
        sign_in user
      end
      it "returns HTTP status 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    context "when not logged in" do
      it "returns HTTP status 302 then redirects" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end
end