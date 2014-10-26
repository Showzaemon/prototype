require 'rails_helper'

RSpec.describe "dmc_console", :type => :request do

	Capybara.default_wait_time = 4

	describe "nomal case" do
	  it "stop scheduling" do
	    visit '/dmc_console/show'

	    expect(page).to have_content("DMC Console")
	    click_button "start"

	    expect(page).to have_content("Running")
	  end
	  it "stop scheduling" do
	    visit '/dmc_console/show'

	    expect(page).to have_content("DMC Console")
	    click_button "stop"

	    expect(page).not_to have_content("Running")
	  end
	end
end