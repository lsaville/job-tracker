require 'rails_helper'

describe "User can edit existing category" do
  scenario "they can go to edit page and put new title" do
    category = Category.create(title: "Baking")

    visit category_path(category)
    click_on "Edit"
    expect(current_path).to eq(edit_category_path(category))

    fill_in "category_title", with: "Roasting"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content "Roasting"
  end
end
