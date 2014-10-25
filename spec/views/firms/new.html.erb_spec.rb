require 'rails_helper'

RSpec.describe "firms/new", :type => :view do
  before(:each) do
    assign(:firm, Firm.new(
      :name => "MyString",
      :step => 1,
      :stock => 1
    ))
  end

  it "renders new firm form" do
    render

    assert_select "form[action=?][method=?]", firms_path, "post" do

      assert_select "input#firm_name[name=?]", "firm[name]"

      assert_select "input#firm_step[name=?]", "firm[step]"

      assert_select "input#firm_stock[name=?]", "firm[stock]"
    end
  end
end
