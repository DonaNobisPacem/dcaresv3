FactoryGirl.define do
  factory :fund do
    description {FFaker::Company.name}
  end
end
