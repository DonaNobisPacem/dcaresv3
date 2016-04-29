class University < ActiveRecord::Base
	validates :description, presence: true, uniqueness: true

	has_many :projects, dependent: :destroy, inverse_of: :university
	accepts_nested_attributes_for :projects, allow_destroy: true
end
