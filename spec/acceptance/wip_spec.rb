require "spec_helper"

feature "WIP" do

  scenario "test env" do
    visit "/"
    page.should have_content "WIP feature"
  end

end
