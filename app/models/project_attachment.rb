class ProjectAttachment < ActiveRecord::Base
  belongs_to :project, inverse_of: :project_attachments

  validates :project, presence: true
  validates :attachment, presence: true, file_size: {less_than_or_equal_to: 2.megabytes} 

  mount_uploader :attachment, AttachmentUploader
end
