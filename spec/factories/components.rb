FactoryGirl.define do
  factory :component do
    project
    title {FFaker::Product.product}
    abc "9.99"
    status 1
    classification 1
    bidding_status 1
    contractor {FFaker::Company.name}
    progress 1
    tdc DateTime.now
    noa DateTime.now
    ntp DateTime.now
    adc DateTime.now
    cost "9.99"
    remarks {FFaker::BaconIpsum.paragraph}
  end
end
