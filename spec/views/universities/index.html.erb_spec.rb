require 'rails_helper'

RSpec.describe "universities/index", type: :view do
  before(:each) do
    assign(:universities, [
      University.create!(
        :description => "Description"
      ),
      University.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of universities" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
