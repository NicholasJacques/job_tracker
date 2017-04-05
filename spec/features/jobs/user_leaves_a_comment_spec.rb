require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    job = create(:job)
    company = job.company
    title = job.title

    visit company_job_path(company, job)
    fill_in "comment[content]", with: "This is a comment"
    click_on "Submit"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("This is a comment")
  end
end