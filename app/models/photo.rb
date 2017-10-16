class Photo < ApplicationRecord
  belongs_to :user
  acts_as_votable

  include PhotoUploader::Attachment.new(:image)

end
