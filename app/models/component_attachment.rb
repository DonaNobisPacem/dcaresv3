class ComponentAttachment < ActiveRecord::Base
  belongs_to :component, inverse_of: :component_attachments
  validates :component, presence: true

  mount_uploader :attachment, AttachmentUploader
  validates :attachment, presence: true
end
