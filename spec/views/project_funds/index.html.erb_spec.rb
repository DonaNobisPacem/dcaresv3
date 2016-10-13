require 'rails_helper'

RSpec.describe "project_funds/index", type: :view do
  before(:each) do
    assign(:project_funds, [
      ProjectFund.create!(
        :source => 1,
        :amount => "9.99",
        :project => nil
      ),
      ProjectFund.create!(
        :source => 1,
        :amount => "9.99",
        :project => nil
      )
    ])
  end

  it "renders a list of project_funds" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
