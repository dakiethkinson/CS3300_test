require 'simplecov'
SimpleCov.start 'rails'
require "rails_helper"


RSpec.feature "Visiting Projects Page", type: :feature do
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

      scenario "The visitor should see projects" do
        visit new_project_path
        expect(page).to have_text("New project")
      end

      scenario "The visitor should see title block" do
        visit new_project_path
        expect(page).to have_text("Title")
      end

      scenario "The visitor should see description block" do
        visit new_project_path
        expect(page).to have_text("Description")
      end

      scenario "The visitor should see Back to projects link" do
        visit new_project_path
        expect(page).to have_link("Back")
      end

      scenario "The visitor should see Create Project Button" do
        visit new_project_path
        expect(page).to have_button("Create Project")
      end
    end
  end
end

RSpec.feature "Projects", type: :feature do
  context "Sign in user" do
    before(:each) do
      visit new_session_path
      within(id = "new_user") do
        fill_in "email", with: user.email
        fill_in "password", with: user.password
        click_button "Log In"
        expect(page).to have_text "Signed in successfully."
      end

      context "Create new project" do
        before(:each) do
          visit new_project_path
          within("form") do
            fill_in "Title", with: "Test title"
          end
        end
    
        scenario "should be successful" do
          fill_in "Description", with: "Test description"
          click_button "Create Project"
          expect(page).to have_content("Project was successfully created")
        end
    
        scenario "should fail" do
          click_button "Create Project"
          expect(page).to have_content("Description can't be blank")
        end
      end

      context "Update project" do
        let(:project) { Project.create(title: "Test title", description: "Test content") }
        before(:each) do
          visit edit_project_path(project)
        end
    
        scenario "should be successful" do
          within("form") do
            fill_in "Description", with: "New description content"
          end
          click_button "Update Project"
          expect(page).to have_content("Project was successfully updated")
        end
    
        scenario "should fail" do
          within("form") do
            fill_in "Description", with: ""
          end
          click_button "Update Project"
          expect(page).to have_content("Description can't be blank")
        end
      end

      context "Remove existing project" do
        let!(:project) { Project.create(title: "Test title", description: "Test content") }
        scenario "remove project" do
        visit project_path(project)
        click_button "Delete"
        expect(page).to have_content("Project was successfully destroyed")
        expect(Project.count).to eq(0)
        
      end
    end      
    end
  end  
end
