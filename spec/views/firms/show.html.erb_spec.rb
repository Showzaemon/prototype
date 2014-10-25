require 'rails_helper'

RSpec.describe "firms/show", :type => :view do
  before(:each) do
    @firm = assign(:firm, Firm.create!(
      :name => "Name",
      :step => 1,
      :stock => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
