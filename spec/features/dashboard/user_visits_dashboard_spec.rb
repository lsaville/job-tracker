require 'rails_helper'

describe "user visits the dashboard" do
  scenario "they see job count by level of interest" do
    company = Company.create(name: "ESPN", city: "LA")
    category = Category.create(title: "Blah")
    company.jobs << Job.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000, category: category )

    visit dashboard_index_path

    within ".level_of_interest" do
      expect(page).to have_content "2000"
    end
  end

  scenario "they see top three companies by level of interest avg" do
    company1 = Company.create(name: "ESPN", city: "LA")
    company2 = Company.create(name: "Noodles and Company", city: "Denver")
    company3 = Company.create(name: "Illegal Pete's", city: "Denver")
    category = Category.create(title: "Blah")
    company1.jobs << Job.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000, category: category )
    company2.jobs << Job.create(title: "reporter", description: "haciendose la vaca", level_of_interest: 10, category: category )
    company3.jobs << Job.create(title: "minion", description: "haciendose la vaca", level_of_interest: 1000, category: category )

    visit dashboard_index_path
    within(".top_three") do
      expect(page).to have_content "ESPN has an average job interest of 2000"
    end
  end

  scenario "they see a count of jobs by location" do
    company = Company.create(name: "ESPN", city: "LA")
    category = Category.create(title: "Blah")
    jobs = company.jobs << Job.create(title: "schmuck", description: "haciendose la vaca", level_of_interest: 2000, category: category )

    visit dashboard_index_path
    
    within(".count_location") do
      expect(page).to have_content "LA has 1 jobs"
    end
  end
end
