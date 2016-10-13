require 'rails_helper'

RSpec.describe ComponentAttachment, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:component_attachment) ).to be_valid 
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:attachment) }
  end

  describe "ActiveRecord Validations" do
    it { should belong_to(:component) }
    it { should validate_presence_of(:component) }
  end
end
