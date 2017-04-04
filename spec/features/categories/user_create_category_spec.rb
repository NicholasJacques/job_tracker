require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do

    visit new_category_path
    fill_in "category[title]", with: "Entry Level"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Entry Level")
    expect(Category.count).to eq(1)
  end

  scenario "user tries to create a category that already exists" do

    title = create(:category).title

    visit new_category_path
    fill_in "category[title]", with: title
    click_button "Create"

    expect(current_path).to eq(new_category_path)
    expect(Category.count).to eq(1)
  end
end
