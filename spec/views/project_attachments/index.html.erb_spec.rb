require 'rails_helper'

RSpec.describe "project_attachments/index", type: :view do
  before(:each) do
    assign(:project_attachments, [
      ProjectAttachment.create!(
        :attachment => "Attachment",
        :project => nil
      ),
      ProjectAttachment.create!(
        :attachment => "Attachment",
        :project => nil
      )
    ])
  end

  it "renders a list of project_attachments" do
    render
    assert_select "tr>td", :text => "Attachment".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
