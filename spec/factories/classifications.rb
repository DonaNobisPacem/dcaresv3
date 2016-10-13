FactoryGirl.define do
  factory :classification do
    description {FFaker::Unit.temperature_name}
  end
end
