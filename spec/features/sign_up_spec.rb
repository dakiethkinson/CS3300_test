require 'simplecov'
SimpleCov.start 'rails'
require "rails_helper"


RSpec.feature "Visiting Sign Up", type: :feature do
    scenario "The visitor should sign in" do
      user = create(:user)
    end

    scenario "The visitor should see email field" do
        visit new_user_registration_path
        expect(page).to have_text("Email")
    end

    scenario "The visitor should see password field" do
        visit new_user_registration_path
        expect(page).to have_text("Password")
    end

    scenario "The visitor should see password confirmation field" do
        visit new_user_registration_path
        expect(page).to have_text("Password confirmation")
    end

    context " user should be able to register new account" do
      before(:each) do
        visit new_registration_path
        within(id = "new_user") do
          fill_in "email", with: user.email
          fill_in "password", with: user.password
          fill_in "Password confirmation", with: user.password
          click_button "Log up"
          expect(page).to have_text "Welcome! You have signed up successfully."
        end
      end
    end 
  end