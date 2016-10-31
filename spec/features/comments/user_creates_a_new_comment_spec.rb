require "rails_helper"

describe "user creates a comment" do
  scenario "they visit a job page, enter info, submit and are shown the same job page with the comment" do
    company = Company.create(name: "ESPN", city: "LA")
    category = Category.create(title: "Blah")
    job = company.jobs.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000, category: category )

    visit company_job_path(company, job)
    fill_in "comment_content", with: "Had drinks with the ceo, we share a passion for goldfish, seems promising"
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(company, job))
    within("p") do
      expect(page).to have_content "Had drinks"
    end
  end
end
