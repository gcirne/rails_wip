require "spec_helper"

feature "WIP" do

  scenario "rails env is test" do
    Rails.env.stub!(:test?).and_return(true)
    Rails.env.stub!(:development?).and_return(false)

    visit "/"
    
    page.should have_content("WIP feature")
  end

  scenario "rails env is development" do
    Rails.env.stub!(:test?).and_return(false)
    Rails.env.stub!(:development?).and_return(true)

    visit "/"
    
    page.should have_content("WIP feature")
  end

  scenario "rails env is something other than test and development" do
    Rails.env.stub!(:test?).and_return(false)
    Rails.env.stub!(:development?).and_return(false)
    
    visit "/"
    
    page.should have_no_content("WIP feature")
  end

  scenario "rails env is something other than test and development but query string is wip=true" do
    Rails.env.stub!(:test?).and_return(false)
    Rails.env.stub!(:development?).and_return(false)
    
    visit "/?wip=true"
    
    page.should have_content("WIP feature")
  end

end
