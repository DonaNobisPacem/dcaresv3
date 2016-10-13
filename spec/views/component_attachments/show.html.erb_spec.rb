require 'rails_helper'

RSpec.describe "component_attachments/show", type: :view do
  before(:each) do
    @component_attachment = assign(:component_attachment, ComponentAttachment.create!(
      :attachment => "Attachment",
      :component => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Attachment/)
    expect(rendered).to match(//)
  end
end
