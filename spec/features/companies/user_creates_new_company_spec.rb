require 'rails_helper'

describe "User creates a new company" do
  context "valid params" do
    scenario "a user can create a new company" do
      visit companies_path

      click_link "Add Company"
      expect(current_path).to eq(new_company_path)
      fill_in "company[name]", with: "ESPN"
      fill_in "company[city]", with: "LA"
      click_button "Create"

      expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
      expect(page).to have_content("ESPN")
      expect(Company.count).to eq(1)
    end
  end

  context "invalid params" do
    scenario "a user sees and error message when missing name" do
      visit companies_path

      click_link "Add Company"

      expect(current_path).to eq(new_company_path)
      fill_in "company[city]", with: "LA"
      click_button "Create"

      expect(page).to have_content "Name can't be blank"
      expect(Company.count).to eq(0)
    end
  end
end
