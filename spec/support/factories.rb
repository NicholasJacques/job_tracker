FactoryGirl.define do
  
  factory :company do
    name "ESPN"
  end

  factory :job do
    title             "Developer"
    description       "What a great position!"
    level_of_interest 90
    city              "Denver"
    company
  end
end