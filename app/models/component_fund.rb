class ComponentFund < ActiveRecord::Base
  belongs_to :component, inverse_of: :component_funds

  validates :component, presence: true
  validates :source, presence: true, numericality: { greater_than: 0, allow_nil: false }
  validates :amount, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  def source_name
  	Fund.find_by_id(source) ? Fund.find(source).description : "Not Available"
  end
end
