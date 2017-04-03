require 'rails_helper'

describe "User deletes a job" do
  scenario "a user can delete a job" do
    job = create(:job)
    company = job.company
    job_title = job.title

    visit company_job_path(company, job)
    click_on "Delete"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).not_to have_content(job_title)
  end
end