require "rails_helper"

RSpec.describe ComponentFundsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/component_funds").to route_to("component_funds#index")
    end

    it "routes to #new" do
      expect(:get => "/component_funds/new").to route_to("component_funds#new")
    end

    it "routes to #show" do
      expect(:get => "/component_funds/1").to route_to("component_funds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/component_funds/1/edit").to route_to("component_funds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/component_funds").to route_to("component_funds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/component_funds/1").to route_to("component_funds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/component_funds/1").to route_to("component_funds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/component_funds/1").to route_to("component_funds#destroy", :id => "1")
    end

  end
end
