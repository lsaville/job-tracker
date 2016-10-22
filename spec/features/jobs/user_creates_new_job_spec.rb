require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create(name: "ESPN", city: "NYC")
    category = Category.create(title: "Blah")

    visit companies_path
    click_link "ESPN"
    expect(page).to have_current_path(company_jobs_path(company))
    click_link "Create Job"
    expect(page).to have_current_path(new_company_job_path(company))

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    select category.title, from: "job_category_id"
    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Blah")
  end
end
