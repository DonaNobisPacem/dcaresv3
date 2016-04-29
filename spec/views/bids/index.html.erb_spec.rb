require 'rails_helper'

RSpec.describe "bids/index", type: :view do
  before(:each) do
    assign(:bids, [
      Bid.create!(
        :description => "Description"
      ),
      Bid.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of bids" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
