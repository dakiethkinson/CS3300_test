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
  
end