require 'rails_helper'

RSpec.describe ComponentFund, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:component_fund) ).to be_valid 
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:source) }
  end

  describe "ActiveRecord Validations" do
    it { should belong_to(:component) }
    it { should validate_presence_of(:component) }
  end

  context "Custom Functions" do
  	it "returns the correct source name" do
  	  component = FactoryGirl.create(:component)
  	  fund = FactoryGirl.create(:fund)
  	  component_fund = FactoryGirl.create(:component_fund, component: component, source: fund.id )

  	  expect(component_fund.source_name).to eq(fund.description)
  	end
  end
end
