class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :touken
end
