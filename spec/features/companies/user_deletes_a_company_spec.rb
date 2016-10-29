require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = Company.create(name: "ESPN", city: "LA")
    visit companies_path

    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("ESPN was successfully deleted!")
  end

  scenario "a user can delete a company with dependent jobs" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs << Job.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000)

    visit companies_path
    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("ESPN was successfully deleted!")
  end
end
