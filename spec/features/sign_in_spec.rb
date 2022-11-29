require 'simplecov'
SimpleCov.start 'rails'
require "rails_helper"


RSpec.feature "Visiting Sign In", type: :feature do

    scenario "The visitor should see email field" do
        visit new_user_session_path
        expect(page).to have_text("Email")
    end
    scenario "The visitor should see password field" do
        visit new_user_session_path
        expect(page).to have_text("Password")
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