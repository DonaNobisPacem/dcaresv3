require 'rails_helper'

RSpec.describe "ComponentAttachments", type: :request do
  describe "GET /component_attachments" do
    it "works! (now write some real specs)" do
      get component_attachments_path
      expect(response).to have_http_status(200)
    end
  end
end
