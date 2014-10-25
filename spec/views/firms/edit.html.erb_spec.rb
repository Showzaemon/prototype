require 'rails_helper'

RSpec.describe "firms/edit", :type => :view do
  before(:each) do
    @firm = assign(:firm, Firm.create!(
      :name => "MyString",
      :step => 1,
      :stock => 1
    ))
  end

  it "renders the edit firm form" do
    render

    assert_select "form[action=?][method=?]", firm_path(@firm), "post" do

      assert_select "input#firm_name[name=?]", "firm[name]"

      assert_select "input#firm_step[name=?]", "firm[step]"

      assert_select "input#firm_stock[name=?]", "firm[stock]"
    end
  end
end
