class Touken < ApplicationRecord
  has_one_attached :touken
  belongs_to :user
  #has_many :touken_comments, dependent: :destroy
end
