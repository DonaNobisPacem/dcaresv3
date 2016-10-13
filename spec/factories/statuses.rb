FactoryGirl.define do
  factory :status do
    description {FFaker::Unit.temperature_name}
  end
end
