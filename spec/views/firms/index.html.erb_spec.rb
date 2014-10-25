require 'rails_helper'

RSpec.describe "firms/index", :type => :view do
  before(:each) do
    assign(:firms, [
      Firm.create!(
        :name => "Name",
        :step => 1,
        :stock => 2
      ),
      Firm.create!(
        :name => "Name",
        :step => 1,
        :stock => 2
      )
    ])
  end

  it "renders a list of firms" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
