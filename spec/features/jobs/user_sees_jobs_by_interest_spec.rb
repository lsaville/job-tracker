require 'rails_helper'

describe "user sees jobs by interest from dashboard link" do
  scenario "they see jobs by interest" do
    company = Company.create(name: "ESPN", city: "LA")
    category = Category.create(title: "Blah")
    jobs = company.jobs << Job.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000, category: category )

    visit dashboard_index_path
    click_on "Jobs by Interest"

    expect(page).to have_content "schmuck at ESPN: 2000"
  end
end
