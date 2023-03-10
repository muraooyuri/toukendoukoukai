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
  
  #検索ワード機能の記述
  def self.search(keyword)
    if keyword.present?
      # ('title LIKE ?', "#{keyword}%")とワンセットで記述：LIKE部分は小文字でもOK
      joins(:genre).where('title LIKE ? or body LIKE ?', "#{keyword}%", "#{keyword}%")
    else
      all
    end
  end
end