class Touken < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :touken_comments, dependent: :destroy
  belongs_to :genre
  has_many :categories
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  validates :title, presence: true, length:{maximum: 50}
  validates :body, presence: true, length:{maximum: 200}
  
  def self.search(keyword)
    if keyword.present?
      where('title LIKE ?', "#{keyword}%")
    else
      all
    end
  end
end