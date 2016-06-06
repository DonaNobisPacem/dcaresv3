require 'rails_helper'

RSpec.describe "component_funds/edit", type: :view do
  before(:each) do
    @component_fund = assign(:component_fund, ComponentFund.create!(
      :source => 1,
      :amount => "9.99",
      :component => nil
    ))
  end

  it "renders the edit component_fund form" do
    render

    assert_select "form[action=?][method=?]", component_fund_path(@component_fund), "post" do

      assert_select "input#component_fund_source[name=?]", "component_fund[source]"

      assert_select "input#component_fund_amount[name=?]", "component_fund[amount]"

      assert_select "input#component_fund_component_id[name=?]", "component_fund[component_id]"
    end
  end
end
