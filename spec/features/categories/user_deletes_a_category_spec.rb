require 'rails_helper'

describe "User deletes a category" do
  scenario "User can delete a category" do
    category_1, category_2 = create_list(:category, 2)
    title_1 = category_1.title
    title_2 = category_2.title

    visit categories_path

    within("li:first") do
      click_on "Delete"
    end

    expect(page).to_not have_content(title_1)
  end
end