require 'rails_helper'

describe "User deletes a job" do
  scenario "they can delete a job" do
    company = Company.create(name: "ESPN", city: "LA")
    jobs = company.jobs << Job.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000 )
    job = jobs.first

    visit company_job_path(company, job)
    click_link "Delete"

    expect(page).to have_current_path(company_jobs_path(company, job))
    expect(page).to have_content "schmuck was successfully deleted!"
  end
end
