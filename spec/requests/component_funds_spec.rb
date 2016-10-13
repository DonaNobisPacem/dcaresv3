require 'rails_helper'

RSpec.describe "ComponentFunds", type: :request do
  describe "GET /component_funds" do
    it "works! (now write some real specs)" do
      get component_funds_path
      expect(response).to have_http_status(200)
    end
  end
end
