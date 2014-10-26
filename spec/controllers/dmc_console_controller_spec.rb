require 'rails_helper'

RSpec.describe DmcConsoleController, :type => :controller do

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get :show
      expect(response).to render_template("show")
    end
  end

  describe "GET chainge" do
    it "returns http success" do
      get :change
      expect(response).to be_success
    end
    it "renders the index template" do
      get :change
      expect(response).to render_template("show")
    end
  end
end
