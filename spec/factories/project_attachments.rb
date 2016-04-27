FactoryGirl.define do
  factory :project_attachment do
    attachment { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', '1461562681696.jpg')) }
    project
  end
end
