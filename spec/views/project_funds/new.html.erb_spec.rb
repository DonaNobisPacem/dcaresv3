require 'rails_helper'

RSpec.describe "project_funds/new", type: :view do
  before(:each) do
    assign(:project_fund, ProjectFund.new(
      :source => 1,
      :amount => "9.99",
      :project => nil
    ))
  end

  it "renders new project_fund form" do
    render

    assert_select "form[action=?][method=?]", project_funds_path, "post" do

      assert_select "input#project_fund_source[name=?]", "project_fund[source]"

      assert_select "input#project_fund_amount[name=?]", "project_fund[amount]"

      assert_select "input#project_fund_project_id[name=?]", "project_fund[project_id]"
    end
  end
end
