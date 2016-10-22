require 'rails_helper'

describe "User sees all categories" do
  scenario "they see page with existing categories" do
    category = Category.create(title: "Baking")
    category = Category.create(title: "BlackSmithing")

    visit categories_path

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Baking")
    expect(page).to have_content("BlackSmithing")
  end
end
