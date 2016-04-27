FactoryGirl.define do
  factory :project do
    title {FFaker::Product.product}
    abc "9.99"
    status 1
    bidding_status 1
    contractor {FFaker::Company.name}
    progress 1
    tdc DateTime.now
    noa DateTime.now
    ntp DateTime.now
    adc DateTime.now
    cost "9.99"
    university
  end
end
