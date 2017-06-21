class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  mount_uploader :poster, PosterUploader
end
