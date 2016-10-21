require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    company = Company.create(name: "ESPN", city: "LA")

    visit new_company_job_path(company)
    save_and_open_page

  end
end
