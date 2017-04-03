require 'rails_helper'

describe "User clicks job title from company page" do
  scenario "a user sees a job show page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)
    click_on "Developer"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("90")
    expect(page).to have_content("Denver")
  end
end