require 'rails_helper'

RSpec.describe "component_attachments/new", type: :view do
  before(:each) do
    assign(:component_attachment, ComponentAttachment.new(
      :attachment => "MyString",
      :component => nil
    ))
  end

  it "renders new component_attachment form" do
    render

    assert_select "form[action=?][method=?]", component_attachments_path, "post" do

      assert_select "input#component_attachment_attachment[name=?]", "component_attachment[attachment]"

      assert_select "input#component_attachment_component_id[name=?]", "component_attachment[component_id]"
    end
  end
end
