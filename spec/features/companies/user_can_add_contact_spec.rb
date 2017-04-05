require 'rails_helper'

describe "user adds contact to company" do
  scenario "user adds contact with correct params" do
      company = create(:company)
      visit company_jobs_path(company)

      fill_in "contact[full_name]", with: "John Doe"
      fill_in "contact[position]", with: "Hiring Manager"
      fill_in "contact[email]", with: "John_Doe@example.com"
      click_on "Add Contact"

      expect(current_path).to eq(company_jobs_path(company))
      expect(page).to have_content("John Doe")
      expect(page).to have_content("Hiring Manager")
      expect(page).to have_content("John_Doe@example.com")
  end
end