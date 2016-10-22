require 'rails_helper'

describe "User sees one category" do
  scenario "they see a category with jobs" do
    company = Company.create(name: "ESPN", city: "Nowhere")
    category = Category.create(title: "Baking")
    job = Job.create(title: "Bus Driver", description: "Drives the bus", level_of_interest: 549, company: company, category: category )

    visit category_path(category)
    expect(current_path).to eq(category_path(category))
    within ("h1") do
      expect(page).to have_content "#{category.title}"
    end
    expect(page).to have_content "#{job.title}"
  end
end
