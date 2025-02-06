class User < ApplicationRecord
  validates :name, presence: true
  has_one_attached :portrait
  # thumb
  has_one_attached :portrait do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
  end
end
