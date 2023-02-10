class Touken < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  #has_many :touken_comments, dependent: :destroy
end
