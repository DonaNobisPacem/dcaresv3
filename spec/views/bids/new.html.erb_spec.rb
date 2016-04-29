require 'rails_helper'

RSpec.describe "bids/new", type: :view do
  before(:each) do
    assign(:bid, Bid.new(
      :description => "MyString"
    ))
  end

  it "renders new bid form" do
    render

    assert_select "form[action=?][method=?]", bids_path, "post" do

      assert_select "input#bid_description[name=?]", "bid[description]"
    end
  end
end
