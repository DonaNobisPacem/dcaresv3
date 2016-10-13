require "rails_helper"

RSpec.describe ComponentAttachmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/component_attachments").to route_to("component_attachments#index")
    end

    it "routes to #new" do
      expect(:get => "/component_attachments/new").to route_to("component_attachments#new")
    end

    it "routes to #show" do
      expect(:get => "/component_attachments/1").to route_to("component_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/component_attachments/1/edit").to route_to("component_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/component_attachments").to route_to("component_attachments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/component_attachments/1").to route_to("component_attachments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/component_attachments/1").to route_to("component_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/component_attachments/1").to route_to("component_attachments#destroy", :id => "1")
    end

  end
end
