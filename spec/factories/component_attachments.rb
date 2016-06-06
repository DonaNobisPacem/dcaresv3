FactoryGirl.define do
  factory :component_attachment do
    attachment { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', '1461562681696.jpg')) }
    component
  end
end
