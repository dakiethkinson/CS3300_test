require "rails_helper"


RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end

  scenario "The visitor should see New Project link" do
    visit root_path
    expect(page).to have_text("New project")
  end

  scenario "The visitor should see Home Page Link link" do
    visit root_path
    expect(page).to have_text("CS3300")
  end

  scenario "The visitor should see Sign In Link" do
    visit root_path
    expect(page).to have_text("Sign In")
  end

  scenario "The visitor should see Sign Up Link" do
    visit root_path
    expect(page).to have_text("Sign Up")
  end
  
end