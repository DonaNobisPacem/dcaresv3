require 'rails_helper'

RSpec.describe "component_funds/index", type: :view do
  before(:each) do
    assign(:component_funds, [
      ComponentFund.create!(
        :source => 1,
        :amount => "9.99",
        :component => nil
      ),
      ComponentFund.create!(
        :source => 1,
        :amount => "9.99",
        :component => nil
      )
    ])
  end

  it "renders a list of component_funds" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
