class ToukenComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :touken
  validates :comment, presence: true, length:{maximum: 20}
end
