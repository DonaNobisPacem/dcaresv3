require 'rails_helper'

RSpec.describe "components/show", type: :view do
  before(:each) do
    @component = assign(:component, Component.create!(
      :project => nil,
      :title => "Title",
      :abc => "9.99",
      :status => 1,
      :classification => 2,
      :bidding_status => 3,
      :contractor => "Contractor",
      :progress => 4,
      :cost => "9.99",
      :remarks => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Contractor/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
  end
end
