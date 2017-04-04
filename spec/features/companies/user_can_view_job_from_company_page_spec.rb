require 'rails_helper'

describe "User clicks job title from company page" do
  scenario "a user sees a job show page" do
    job = create(:job)
    company = job.company
    level_of_interest = job.level_of_interest
    city = job.city


    visit company_path(company)
    click_on "Developer"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content(level_of_interest)
    expect(page).to have_content(city)
  end
end