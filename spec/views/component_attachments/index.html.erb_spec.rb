require 'rails_helper'

RSpec.describe "component_attachments/index", type: :view do
  before(:each) do
    assign(:component_attachments, [
      ComponentAttachment.create!(
        :attachment => "Attachment",
        :component => nil
      ),
      ComponentAttachment.create!(
        :attachment => "Attachment",
        :component => nil
      )
    ])
  end

  it "renders a list of component_attachments" do
    render
    assert_select "tr>td", :text => "Attachment".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
