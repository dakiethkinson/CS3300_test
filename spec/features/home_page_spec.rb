require 'simplecov'
SimpleCov.start 'rails'
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

  scenario "The visitor should About section" do
    visit root_path
    expect(page).to have_text("Daniel Atkinson Portfolio Project")
  end
  
end

RSpec.feature "Visiting the homepage", type: :feature do
  context "Sign Out" do
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
  
        scenario "The visitor should see Sign Out" do
          click_button "Sign Out"
          expect(page).to have_text("Signed out successfully.")
        end

        scenario "The visitor should see user menu after login" do
          visit root_path
          expect(page).to have_text("Menu")
        end
      end
    end    
  end 
end





