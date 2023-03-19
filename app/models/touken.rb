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
  
  # ( presence: true )入力部分が空白の場合エラーメッセージが表示される
  # ( length:{maximum: 50}  length:{maximum: 200} )【max(最大)】の入力文字数
  validates :title, presence: true, length:{maximum: 50}
  validates :body, presence: true, length:{maximum: 200}
  
  # キーワード(投稿タイトル・投稿内容)で検索出来る様にする記述
  def self.search(keyword)
    if keyword.present?
      # ('title LIKE ?', "#{keyword}%")とワンセットで記述：LIKE部分は小文字でもOK
      joins(:genre).where('title LIKE ? or body LIKE ?', "#{keyword}%", "#{keyword}%")
    else
      all
    end
  end
end