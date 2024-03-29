class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :toukens
  has_many :toukens, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :touken_comments, dependent: :destroy
  
  # ( presence: true )入力部分が空白の場合エラーメッセージが表示される
  # ( length:length:{minimum: 2... )【min(最少)】の入力文字数
  # ( length:{maximum: 20} )【max(最大)】の入力文字数
  validates :name, presence: true, uniqueness: true, length:{minimum: 2, maximum: 20}
  validates :introduction, length:{maximum: 50}

  # ゲストログインの記述
  def self.guest
    # (name: 'guestuser' ,email: 'guest@example.com')ゲストログイン時の仮のメールアドレスとユーザー名とパスワード
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  # キーワード(ユーザー名)で検索出来る様にする記述
  def self.search(keyword)
    if keyword.present?
          # ('name LIKE ?', "#{keyword}%")とワンセットで記述
      where('name LIKE ?' , "#{keyword}%")
                # LIKE部分は小文字でもOK
    else
      all
    end
  end
end
