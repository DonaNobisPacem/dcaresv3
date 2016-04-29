require 'rails_helper'

RSpec.describe University, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:university) ).to be_valid 
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:description) }
  	it { should validate_uniqueness_of(:description) }
  end

  describe "ActiveRecord Validations" do
    it { should have_many(:projects) }
    it { should accept_nested_attributes_for(:projects).allow_destroy(true) }
  end
end
