require 'rails_helper'

RSpec.describe "universities/new", type: :view do
  before(:each) do
    assign(:university, University.new(
      :description => "MyString"
    ))
  end

  it "renders new university form" do
    render

    assert_select "form[action=?][method=?]", universities_path, "post" do

      assert_select "input#university_description[name=?]", "university[description]"
    end
  end
end
