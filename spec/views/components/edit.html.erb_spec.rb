require 'rails_helper'

RSpec.describe "components/edit", type: :view do
  before(:each) do
    @component = assign(:component, Component.create!(
      :project => nil,
      :title => "MyString",
      :abc => "9.99",
      :status => 1,
      :classification => 1,
      :bidding_status => 1,
      :contractor => "MyString",
      :progress => 1,
      :cost => "9.99",
      :remarks => "MyText"
    ))
  end

  it "renders the edit component form" do
    render

    assert_select "form[action=?][method=?]", component_path(@component), "post" do

      assert_select "input#component_project_id[name=?]", "component[project_id]"

      assert_select "input#component_title[name=?]", "component[title]"

      assert_select "input#component_abc[name=?]", "component[abc]"

      assert_select "input#component_status[name=?]", "component[status]"

      assert_select "input#component_classification[name=?]", "component[classification]"

      assert_select "input#component_bidding_status[name=?]", "component[bidding_status]"

      assert_select "input#component_contractor[name=?]", "component[contractor]"

      assert_select "input#component_progress[name=?]", "component[progress]"

      assert_select "input#component_cost[name=?]", "component[cost]"

      assert_select "textarea#component_remarks[name=?]", "component[remarks]"
    end
  end
end
