FactoryGirl.define do
  factory :university do
    description {FFaker::Education.school}
  end
end
