require "rails_helper"

RSpec.describe ProfileController, :type => :controller do

  describe "GET #index" do
    context "when logged" do
      login_user
      it "returns HTTP status 200" do
        get :index
        expect(response).to be_successful
      end
    end

    context "when not logged in" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
