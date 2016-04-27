require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :title => "MyString",
      :abc => "9.99",
      :status => 1,
      :bidding_status => 1,
      :contractor => "MyString",
      :progress => 1,
      :cost => "9.99",
      :university => nil
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_title[name=?]", "project[title]"

      assert_select "input#project_abc[name=?]", "project[abc]"

      assert_select "input#project_status[name=?]", "project[status]"

      assert_select "input#project_bidding_status[name=?]", "project[bidding_status]"

      assert_select "input#project_contractor[name=?]", "project[contractor]"

      assert_select "input#project_progress[name=?]", "project[progress]"

      assert_select "input#project_cost[name=?]", "project[cost]"

      assert_select "input#project_university_id[name=?]", "project[university_id]"
    end
  end
end
