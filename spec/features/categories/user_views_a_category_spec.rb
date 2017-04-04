require 'rails_helper'

describe "User visits a category show page" do
  scenario "User sees jobs for that category" do
    job = create(:job)
    category = job.category
    category_title = category.title
    job_title = job.title

    visit category_path(category)

    expect(page).to have_content(category_title)
    within("ul") do
      expect(page).to have_link job_title, href: company_job_path(job.company, job)
      expect(page).to have_content(job.company.name)
    end
  end
end