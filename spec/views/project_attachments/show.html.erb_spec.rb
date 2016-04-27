require 'rails_helper'

RSpec.describe "project_attachments/show", type: :view do
  before(:each) do
    @project_attachment = assign(:project_attachment, ProjectAttachment.create!(
      :attachment => "Attachment",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Attachment/)
    expect(rendered).to match(//)
  end
end
