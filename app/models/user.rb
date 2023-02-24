class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :toukens
  has_many :toukens, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :touken_comments, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length:{minimum: 2, maximum: 20}
  validates :introduction, length:{maximum: 50}
  
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
  def self.search(keyword)
    if keyword.present?
      joins(:genre).where('users.name LIKE ?' , "#{keyword}%")
    else
      all
    end
  end
end
