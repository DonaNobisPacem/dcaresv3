require 'rails_helper'

RSpec.describe "project_attachments/new", type: :view do
  before(:each) do
    assign(:project_attachment, ProjectAttachment.new(
      :attachment => "MyString",
      :project => nil
    ))
  end

  it "renders new project_attachment form" do
    render

    assert_select "form[action=?][method=?]", project_attachments_path, "post" do

      assert_select "input#project_attachment_attachment[name=?]", "project_attachment[attachment]"

      assert_select "input#project_attachment_project_id[name=?]", "project_attachment[project_id]"
    end
  end
end