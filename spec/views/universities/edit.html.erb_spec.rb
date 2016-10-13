require 'rails_helper'

RSpec.describe "universities/edit", type: :view do
  before(:each) do
    @university = assign(:university, University.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit university form" do
    render

    assert_select "form[action=?][method=?]", university_path(@university), "post" do

      assert_select "input#university_description[name=?]", "university[description]"
    end
  end
end
