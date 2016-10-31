require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create(name: "ESPN", city: "LA")
    category = Category.create(title: "Blah")
    jobs = company.jobs << Job.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000, category: category )
    job = jobs.first

    visit company_path(company)
    click_link "schmuck"
    expect(page).to have_current_path(company_job_path(company, job))
    click_link "Edit"
    expect(page).to have_current_path(edit_company_job_path(company, job))
    fill_in "job_title", with: "Awesome Job Title"
    click_button "Update Job"

    expect(page).to have_content "Awesome Job Title"
  end
end
