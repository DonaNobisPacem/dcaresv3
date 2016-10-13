require 'rails_helper'

RSpec.describe "components/index", type: :view do
  before(:each) do
    assign(:components, [
      Component.create!(
        :project => nil,
        :title => "Title",
        :abc => "9.99",
        :status => 1,
        :classification => 2,
        :bidding_status => 3,
        :contractor => "Contractor",
        :progress => 4,
        :cost => "9.99",
        :remarks => "MyText"
      ),
      Component.create!(
        :project => nil,
        :title => "Title",
        :abc => "9.99",
        :status => 1,
        :classification => 2,
        :bidding_status => 3,
        :contractor => "Contractor",
        :progress => 4,
        :cost => "9.99",
        :remarks => "MyText"
      )
    ])
  end

  it "renders a list of components" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Contractor".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
