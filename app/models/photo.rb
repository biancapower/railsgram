class Photo < ApplicationRecord
  belongs_to :user

  include PhotoUploader::Attachment.new(:image)
end
