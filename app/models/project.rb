class Project < ActiveRecord::Base
  belongs_to :university, inverse_of: :projects

  searchkick
  acts_as_xlsx
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  validates :university, presence: true
  validates :title, presence: true, uniqueness: true
  #validates :abc, numericality: { :greater_than_or_equal => 0 }
  validates :abc, numericality: { :greater_than_or_equal_to => 0 }, presence: true
  #validates :status, numericality: { :greater_than => 0 }
  validates :status, numericality: { :greater_than => 0 }, presence: true

  validates_presence_of :bidding_status, if: :is_for_bidding?

  validates_presence_of :contractor, if: :is_ongoing?
  validates_presence_of :progress, if: :is_ongoing?
  validates_presence_of :tdc, if: :is_ongoing?
  validates_presence_of :noa, if: :is_ongoing?
  validates_presence_of :ntp, if: :is_ongoing?

  validates_presence_of :contractor, if: :is_completed?
  validates_presence_of :cost, if: :is_completed?
  validates_presence_of :adc, if: :is_completed?
  validates_presence_of :noa, if: :is_completed?
  validates_presence_of :ntp, if: :is_completed?

  validates :bidding_status, numericality: { :greater_than => 0, allow_nil: true }
  validates :progress, numericality: { :greater_than_or_equal_to => 0, allow_nil: true }
  validates :cost, numericality: { :greater_than_or_equal_to => 0, allow_nil: true }

  has_many :project_funds, dependent: :destroy, inverse_of: :project
  has_many :project_attachments, dependent: :destroy, inverse_of: :project

  accepts_nested_attributes_for :project_funds, allow_destroy: true
  accepts_nested_attributes_for :project_attachments, allow_destroy: true	

  def status_desc
  	Status.find(status).description
  end

  def bidding_status_desc
    Bid.find(bidding_status).description
  end

  def is_for_bidding?
    if status == 1 # || status_desc == "For Bidding"
    	return true
    else
    	return false
    end
  end

  def is_ongoing?
    if status == 2 # || status_desc == "Ongoing"
    	return true
    else
    	return false
    end
  end

  def is_completed?
    if status == 3 # || status_desc == "Completed"
    	return true
    else
    	return false
    end
  end
end
