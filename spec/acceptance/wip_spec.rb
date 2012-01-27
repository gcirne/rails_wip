require "spec_helper"

feature "WIP" do

  scenario "rails env is test" do
    visit "/"
    page.should have_content("WIP feature")
  end

  scenario "rails env is something other than test" do
    Rails.env.stub!(:test?).and_return(false)
    visit "/"
    page.should have_no_content("WIP feature")
  end

end
