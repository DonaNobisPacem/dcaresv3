require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :title => "Title",
        :abc => "9.99",
        :status => 1,
        :bidding_status => 2,
        :contractor => "Contractor",
        :progress => 3,
        :cost => "9.99",
        :university => nil
      ),
      Project.create!(
        :title => "Title",
        :abc => "9.99",
        :status => 1,
        :bidding_status => 2,
        :contractor => "Contractor",
        :progress => 3,
        :cost => "9.99",
        :university => nil
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Contractor".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
