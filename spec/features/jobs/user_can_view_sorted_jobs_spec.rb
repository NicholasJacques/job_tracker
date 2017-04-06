require 'rails_helper'

describe "User visits jobs root" do
  scenario "user sees jobs sorted by location" do
    job_1, job_2 = create_list(:job, 2)
    title_1 = job_1.title
    city = job_1.city

    visit jobs_path(:sort => :location)

    within("li.city") do
      expect(page).to have_content(city)
    end

    within("li.job:first") do
      expect(page).to have_content(title_1)
    end
  end
end