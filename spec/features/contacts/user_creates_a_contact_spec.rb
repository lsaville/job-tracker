require 'rails_helper'

describe "user creates a contact from job#show" do
  scenario "a user can create a new contact" do
    company = Company.create(name: "ESPN", city: "LA")

    visit company_path(company)
    fill_in "contact_first_name", with: "fulano"
    fill_in "contact_last_name", with: "mengano"
    fill_in "contact_position", with: "Senior iOs engineer"
    fill_in "contact_email", with: "fulano@gmail.com"
    click_button "Create Contact"

    expect(page).to have_content "fulano"
  end

end
