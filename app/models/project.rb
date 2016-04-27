class Project < ActiveRecord::Base
  belongs_to :university

  searchkick
  acts_as_xlsx
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

end
