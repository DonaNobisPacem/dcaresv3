class ProjectFund < ActiveRecord::Base
  belongs_to :project, inverse_of: :project_funds

  validates :project, presence: true
  validates :source, presence: true, numericality: { greater_than: 0, allow_nil: false }
  validates :amount, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  def source_name
  	Fund.find(source).description
  end
end
