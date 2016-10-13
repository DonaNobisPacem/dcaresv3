require 'rails_helper'

RSpec.describe ProjectFund, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:project_fund) ).to be_valid 
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:source) }
  end

  describe "ActiveRecord Validations" do
    it { should belong_to(:project) }
    it { should validate_presence_of(:project) }
  end

  context "Custom Functions" do
  	it "returns the correct source name" do
  	  project = FactoryGirl.create(:project)
  	  fund = FactoryGirl.create(:fund)
  	  project_fund = FactoryGirl.create(:project_fund, project: project, source: fund.id )

  	  expect(project_fund.source_name).to eq(fund.description)
  	end
  end
end
