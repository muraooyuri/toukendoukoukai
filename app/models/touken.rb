class Touken < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :touken_comments, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end