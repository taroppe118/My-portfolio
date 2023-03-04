class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  
  validates :name,
    uniqueness: true,
    length: { minimum: 2, maximum: 20 }
    
  validates :introduction,
    length: { maximum: 50 }
  
  has_many :places
  has_many :post_images, dependent: :destroy
  
end
