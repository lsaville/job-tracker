require 'rails_helper'

describe "User visits /companies?sort=location from dashboard" do
  scenario "they see a company with the city" do
    company = Company.create(name: "ESPN", city: "LA")
    category = Category.create(title: "Blah")
    company.jobs << Job.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000, category: category )

    visit dashboard_index_path

    click_on "City Sort"

    within("h1") do
      expect(page).to have_content "Location!!!"
    end
    within("ol>li") do
      expect(page).to have_content "ESPN in LA"
    end
    within("ul>li") do
      expect(page).to have_content "schmuck"
    end
  end
end
