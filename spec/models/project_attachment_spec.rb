require 'rails_helper'

RSpec.describe ProjectAttachment, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:project_attachment) ).to be_valid 
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:attachment) }
  end

  describe "ActiveRecord Validations" do
    it { should belong_to(:project) }
    it { should validate_presence_of(:project) }
  end
end
