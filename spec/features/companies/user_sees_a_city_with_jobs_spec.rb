require 'rails_helper'

describe "User visits /companies?location=city" do
  scenario "they see the city name and jobs" do
    company = Company.create(name: "ESPN", city: "LA")
    category = Category.create(title: "Blah")
    company.jobs << Job.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000, category: category )

    visit dashboard_index_path

    click_on "LA"
    within("h1") do
      expect(page).to have_content "LA"
    end

    within("h3") do
      expect(page).to have_content "ESPN"
    end

    within("li") do
      expect(page).to have_content "schmuck"
    end
  end
end
