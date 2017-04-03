require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    job = create(:job)
    company = job.company


    visit company_job_path(company, job)
    click_on "Edit"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}/edit")

    fill_in "job[title]", with: "New Title"
    fill_in "job[description]", with: "New Description"
    fill_in "job[level_of_interest]", with: 90
    fill_in "job[city]", with: "New City"
    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("New Description")
    expect(page).to have_content("New Title")
    expect(page).to have_content("90")
    expect(page).to have_content("New City")
  end
end