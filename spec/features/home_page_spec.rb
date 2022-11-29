require "rails_helper"


RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end

  scenario "The visitor should see New Project link" do
    visit root_path
    expect(page).to have_text("New Project")
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

RSpec.feature "Loging in", type: :feature do
  scenario "The visitor should sign in" do
    user = create(:user)
  end

  context "Sign in user" do
    before(:each) do
      visit new_session_path
      within(id = "new_user") do
        fill_in "email", with: user.email
        fill_in "password", with: user.password
        click_button "Log In"
        expect(page).to have_text "Signed in successfully."
      end
    end
  end  
end