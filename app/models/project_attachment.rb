class ProjectAttachment < ActiveRecord::Base
  belongs_to :project, inverse_of: :project_attachments
  validates :project, presence: true

  mount_uploader :attachment, AttachmentUploader
  validates :attachment, presence: true
end
