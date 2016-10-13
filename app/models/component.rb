class Component < ActiveRecord::Base
  belongs_to :project, inverse_of: :components

  validates :project, presence: true
  validates :title, presence: true, uniqueness: true
  #validates :abc, numericality: { :greater_than_or_equal => 0 }
  validates :abc, numericality: { :greater_than_or_equal_to => 0 }, presence: true
  #validates :status, numericality: { :greater_than => 0 }
  validates :status, numericality: { :greater_than => 0 }, presence: true
  validates :classification, numericality: { :greater_than => 0 }, presence: true

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

  has_many :component_funds, dependent: :destroy, inverse_of: :component
  has_many :component_attachments, dependent: :destroy, inverse_of: :component

  accepts_nested_attributes_for :component_funds, allow_destroy: true
  accepts_nested_attributes_for :component_attachments, allow_destroy: true

  def status_desc
  	Status.find_by_id(status) ? Status.find(status).description: "Not Available"
  end

  def classification_desc
    Classification.find_by_id(classification) ? Classification.find(classification).description : "Not Available"
  end


  def bidding_status_desc
    Bid.find_by_id(bidding_status) ? Bid.find(bidding_status).description : "Not Available"
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

  def is_funded?
    if status == 4 # || status_desc == "Funded"
      return true
    else
      return false
    end
  end
end
