class Photo < ApplicationRecord
  belongs_to :user
  acts_as_votable

  has_many :comments

  include PhotoUploader::Attachment.new(:image)

end
