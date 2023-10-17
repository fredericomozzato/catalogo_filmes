class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :genre
  has_one_attached :image

  def image_as_thumbnail
    image.variant(resize_to_limit: [300, 300]).processed
  end

  def image_as_icon
    image.variant(resize_to_limit: [80, 80]).processed
  end
end
