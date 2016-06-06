require 'rails_helper'

RSpec.describe "component_funds/show", type: :view do
  before(:each) do
    @component_fund = assign(:component_fund, ComponentFund.create!(
      :source => 1,
      :amount => "9.99",
      :component => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
