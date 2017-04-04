FactoryGirl.define do

  factory :company do
    name
  end

  sequence :name do |n|
    "#{n} Name"
  end

  factory :job do
    title             "Developer"
    description       "What a great position!"
    level_of_interest 90
    city              "Denver"
    company
    category
  end

  factory :category do
    title
  end

  sequence :title do |n|
    "#{n} Title"
  end
end

