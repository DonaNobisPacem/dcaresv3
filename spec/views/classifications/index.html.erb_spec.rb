require 'rails_helper'

RSpec.describe "classifications/index", type: :view do
  before(:each) do
    assign(:classifications, [
      Classification.create!(
        :description => "Description"
      ),
      Classification.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of classifications" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
