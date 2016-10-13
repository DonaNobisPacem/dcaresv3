require 'rails_helper'

RSpec.describe "funds/new", type: :view do
  before(:each) do
    assign(:fund, Fund.new(
      :description => "MyString"
    ))
  end

  it "renders new fund form" do
    render

    assert_select "form[action=?][method=?]", funds_path, "post" do

      assert_select "input#fund_description[name=?]", "fund[description]"
    end
  end
end
