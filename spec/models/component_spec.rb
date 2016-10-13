require 'rails_helper'

RSpec.describe Component, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:component) ).to be_valid 
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:title) }
  	it { should validate_uniqueness_of(:title) }

  	it { should validate_presence_of(:abc) }
  	it { should validate_numericality_of(:abc).is_greater_than_or_equal_to(0) }

  	it { should validate_presence_of(:status) }
  	it { should validate_numericality_of(:status).is_greater_than(0) }

    it { should validate_presence_of(:classification) }
    it { should validate_numericality_of(:classification).is_greater_than(0) }

    context "Status is Funded" do
      before(:each) { allow(subject).to receive(:is_funded?).and_return(true) }

      #Nothing as of yet
    end

  	context "Status is For Bidding" do
  	  before(:each) { allow(subject).to receive(:is_for_bidding?).and_return(true) }

  	  it { should validate_presence_of(:bidding_status) }
  	  it { should validate_numericality_of(:bidding_status).is_greater_than(0) }
   	end

   	context "Status is Ongoing" do
  	  before(:each) { allow(subject).to receive(:is_ongoing?).and_return(true) }

  	  it { should validate_presence_of(:contractor) }
  	  it { should validate_presence_of(:progress) }
  	  it { should validate_numericality_of(:progress).is_greater_than_or_equal_to(0) }
  	  it { should validate_presence_of(:tdc) }
  	  it { should validate_presence_of(:noa) }
  	  it { should validate_presence_of(:ntp) }
   	end

   	context "Status is Completed" do
  	  before(:each) { allow(subject).to receive(:is_completed?).and_return(true) }

  	  it { should validate_presence_of(:contractor) }
  	  it { should validate_presence_of(:cost) }
  	  it { should validate_numericality_of(:cost).is_greater_than_or_equal_to(0) }
  	  it { should validate_presence_of(:adc) }
  	  it { should validate_presence_of(:noa) }
  	  it { should validate_presence_of(:ntp) }
   	end
  end

  describe "ActiveRecord Validations" do
    it { should belong_to(:project) }
    it { should validate_presence_of(:project) }

    it { should have_many(:component_funds) }
    it { should have_many(:component_attachments) }

    it { should accept_nested_attributes_for(:component_funds).allow_destroy(true) }
    it { should accept_nested_attributes_for(:component_attachments).allow_destroy(true) }
  end

  describe "Custom functions validations" do
    it "returns the correct status description" do
  	  status = FactoryGirl.create(:status)
      project = FactoryGirl.create(:project, status: status.id )
      component = FactoryGirl.create(:component, status: status.id, project_id: project.id )

  	  expect(component.status_desc).to eq(status.description)
    end

    it "returns the correct bidding status description" do
      status = FactoryGirl.create(:bid)
      project = FactoryGirl.create(:project, bidding_status: status.id )
      component = FactoryGirl.create(:component, bidding_status: status.id, project_id: project.id )

      expect(component.bidding_status_desc).to eq(status.description)
    end
  end
end
