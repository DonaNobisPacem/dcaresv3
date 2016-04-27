require 'rails_helper'

RSpec.describe "project_attachments/edit", type: :view do
  before(:each) do
    @project_attachment = assign(:project_attachment, ProjectAttachment.create!(
      :attachment => "MyString",
      :project => nil
    ))
  end

  it "renders the edit project_attachment form" do
    render

    assert_select "form[action=?][method=?]", project_attachment_path(@project_attachment), "post" do

      assert_select "input#project_attachment_attachment[name=?]", "project_attachment[attachment]"

      assert_select "input#project_attachment_project_id[name=?]", "project_attachment[project_id]"
    end
  end
end
