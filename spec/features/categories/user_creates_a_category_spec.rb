require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    company = Company.create(name: "ESPN", city: "LA")

    visit new_company_job_path(company)
    click_on "Create Category"
    expect(page).to have_current_path(new_category_path)
    fill_in "category_title", with: "Dev Ops"
    click_on "Create Category"

    expect(page).to have_content "Dev Ops"
  end

  scenario "a user can see categories page" do
    category = Category.create(title: "Dev Ops")
    category = Category.create(title: "Ruby")

    visit categories_path
save_and_open_page
    expect(page).to have_content "Dev Ops"
    expect(page).to have_content "Ruby"
  end
end
