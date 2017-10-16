class Profile < ApplicationRecord
  belongs_to :user

  include PhotoUploader::Attachment.new(:avatar)
end
