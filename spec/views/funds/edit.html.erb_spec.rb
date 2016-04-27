require 'rails_helper'

RSpec.describe "funds/edit", type: :view do
  before(:each) do
    @fund = assign(:fund, Fund.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit fund form" do
    render

    assert_select "form[action=?][method=?]", fund_path(@fund), "post" do

      assert_select "input#fund_description[name=?]", "fund[description]"
    end
  end
end
