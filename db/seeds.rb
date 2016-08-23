# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Status.create(description: "For Bidding")
Status.create(description: "Ongoing")
Status.create(description: "Completed")

Bid.create(description: "Pre-Procurement")
Bid.create(description: "Pre-Bidding")
Bid.create(description: "Opening of Bid")
Bid.create(description: "Post-Qualification")

University.create!([
  {description: "UP Baguio"},
  {description: "UP Cebu"},
  {description: "UP Diliman"},
  {description: "UP Los Banos"},
  {description: "UP Manila"},
  {description: "UP Mindanao"},
  {description: "UP Open University"},
  {description: "UP PGH"},
  {description: "UP System"},
  {description: "UP Visayas"}
])

# PublicActivity.enabled = false

# 100.times do
# 	Project.create(
# 		title: FFaker::Product.product,
# 	    abc: "9.99",
# 	    status: 1,
# 	    bidding_status: 1,
# 	    contractor: FFaker::Company.name,
# 	    progress: 1,
# 	    tdc: DateTime.now,
# 	    noa: DateTime.now,
# 	    ntp: DateTime.now,
# 	    adc: DateTime.now,
# 	    cost: "9.99",
# 	    university_id: 1 
# 	)
# end

# 100.times do
# 	Project.create(
# 		title: FFaker::Product.product,
# 	    abc: "9.99",
# 	    status: 2,
# 	    bidding_status: 1,
# 	    contractor: FFaker::Company.name,
# 	    progress: 1,
# 	    tdc: DateTime.now,
# 	    noa: DateTime.now,
# 	    ntp: DateTime.now,
# 	    adc: DateTime.now,
# 	    cost: "9.99",
# 	    university_id: 1 
# 	)
# end

# 100.times do
# 	Project.create(
# 		title: FFaker::Product.product,
# 	    abc: "9.99",
# 	    status: 3,
# 	    bidding_status: 1,
# 	    contractor: FFaker::Company.name,
# 	    progress: 1,
# 	    tdc: DateTime.now,
# 	    noa: DateTime.now,
# 	    ntp: DateTime.now,
# 	    adc: DateTime.now,
# 	    cost: "9.99",
# 	    university_id: 1 
# 	)
# end