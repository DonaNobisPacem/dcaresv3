require 'rails_helper'

RSpec.describe "funds/index", type: :view do
  before(:each) do
    assign(:funds, [
      Fund.create!(
        :description => "Description"
      ),
      Fund.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of funds" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
