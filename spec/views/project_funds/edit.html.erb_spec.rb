require 'rails_helper'

RSpec.describe "project_funds/edit", type: :view do
  before(:each) do
    @project_fund = assign(:project_fund, ProjectFund.create!(
      :source => 1,
      :amount => "9.99",
      :project => nil
    ))
  end

  it "renders the edit project_fund form" do
    render

    assert_select "form[action=?][method=?]", project_fund_path(@project_fund), "post" do

      assert_select "input#project_fund_source[name=?]", "project_fund[source]"

      assert_select "input#project_fund_amount[name=?]", "project_fund[amount]"

      assert_select "input#project_fund_project_id[name=?]", "project_fund[project_id]"
    end
  end
end
