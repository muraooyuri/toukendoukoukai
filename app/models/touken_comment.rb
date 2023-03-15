class ToukenComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :touken
  # ( presence: true )入力部分が空白の場合エラーメッセージが表示される
  # ( length:{maximum: 20} )【最大】の入力文字数
  validates :comment, presence: true, length:{maximum: 20}
end
