require 'rails_helper'

RSpec.describe "project_funds/show", type: :view do
  before(:each) do
    @project_fund = assign(:project_fund, ProjectFund.create!(
      :source => 1,
      :amount => "9.99",
      :references => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
