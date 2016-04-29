FactoryGirl.define do
  factory :bid do
    description {FFaker::Unit.temperature_name}
  end
end
