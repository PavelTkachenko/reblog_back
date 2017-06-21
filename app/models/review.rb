class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :author

  mount_uploader :image, ImageUploader

  def author_title
    author.title if author
  end
end
