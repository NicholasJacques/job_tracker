require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category)
    category_title = category.title
    visit categories_path
    click_on "Edit"

    expect(current_path).to eq(edit_category_path(category))

    fill_in "category[title]", with: "New Title"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("New Title")
    expect(page).to_not have_content(category_title)
  end

  scenario "a category will not be updated if it does not validate" do
    category = create(:category)
    category_title = category.title
    visit categories_path
    click_on "Edit"

    expect(current_path).to eq(edit_category_path(category))

    fill_in "category[title]", with: nil
    click_button "Update"

    expect(current_path).to eq(edit_category_path(category))
  end
end