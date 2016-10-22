require 'rails_helper'

describe "User sees one category" do
  scenario "they see a category" do
    category = Category.create(title: "Baking")

    visit category_path(category)
    expect(current_path).to eq(category_path(category))
    within ("h1") do
      expect(page).to have_content "#{category.title}"
    end
  end
end
