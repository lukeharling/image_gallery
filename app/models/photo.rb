class Photo < ApplicationRecord
  belongs_to :gallery
  has_one_attached :image
  validates :caption, presence: true
end
