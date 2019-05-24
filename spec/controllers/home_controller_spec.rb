require "rails_helper"

RSpec.describe HomeController, :type => :controller do

  describe "GET #index" do
    it "returns HTTP status 200" do
      get :index
      expect(response).to be_successful
    end
  end

end