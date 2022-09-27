require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET index" do
    it "have http code status 200" do
      get '/events'
      expect(response).to have_http_status("200")
    end

    it "renders the index template" do
      get '/events'
      expect(response).to render_template("index")
    end
  end
end
