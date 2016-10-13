require 'rails_helper'

RSpec.describe "funds/show", type: :view do
  before(:each) do
    @fund = assign(:fund, Fund.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
