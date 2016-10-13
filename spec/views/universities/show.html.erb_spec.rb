require 'rails_helper'

RSpec.describe "universities/show", type: :view do
  before(:each) do
    @university = assign(:university, University.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
