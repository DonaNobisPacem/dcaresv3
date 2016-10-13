require 'rails_helper'

RSpec.describe "classifications/new", type: :view do
  before(:each) do
    assign(:classification, Classification.new(
      :description => "MyString"
    ))
  end

  it "renders new classification form" do
    render

    assert_select "form[action=?][method=?]", classifications_path, "post" do

      assert_select "input#classification_description[name=?]", "classification[description]"
    end
  end
end
