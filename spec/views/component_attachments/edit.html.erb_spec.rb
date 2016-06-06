require 'rails_helper'

RSpec.describe "component_attachments/edit", type: :view do
  before(:each) do
    @component_attachment = assign(:component_attachment, ComponentAttachment.create!(
      :attachment => "MyString",
      :component => nil
    ))
  end

  it "renders the edit component_attachment form" do
    render

    assert_select "form[action=?][method=?]", component_attachment_path(@component_attachment), "post" do

      assert_select "input#component_attachment_attachment[name=?]", "component_attachment[attachment]"

      assert_select "input#component_attachment_component_id[name=?]", "component_attachment[component_id]"
    end
  end
end
