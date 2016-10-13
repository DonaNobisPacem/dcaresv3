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
Status.create(description: "Funded")

Classification.create(description: "New Building/Annex")
Classification.create(description: "New Facility within an Existing Building")
Classification.create(description: "Renovation/Rehabilitation")
Classification.create(description: "Equipment")
Classification.create(description: "Roads and Other Civil Works")

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

Fund.create!([
    {description: "GAA 2012"},
    {description: "GAA 2013"},
    {description: "GAA 2014"},
    {description: "GAA 2015"},
    {description: "GAA 2016"},
    {description: "CHED-DAP"},
    {description: "CIDP"},
    {description: "CU-RF"},
    {description: "UPS-RF",},
    {description: "UGTFI"},
    {description: "DPWH GAA 2013"}
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