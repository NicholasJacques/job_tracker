require 'rails_helper'

describe "User visits categories index" do
  scenario "User can see all categories" do
    category_1, category_2 = create_list(:category, 2)
    title_1 = category_1.title
    title_2 = category_2.title

    visit categories_path

    within("ul") do
      expect(page).to have_link title_1, href: category_path(category_1)
      expect(page).to have_link title_2, href: category_path(category_2)
    end
  end
end
