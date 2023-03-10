class Place < ApplicationRecord
  validates :title,
    presence: true
    
  validates :body,
    presence: true,
    length: { maximum: 200 }
  
  belongs_to :user
  has_many :post_images, dependent: :destroy
end
