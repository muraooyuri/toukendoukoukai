class Genre < ApplicationRecord
    
  has_many :toukens
    
  def self.group_by_name_with_touken_count
    joins(:touken).group(:name).select(:id, :name, 'COUNT(touken.id) as touken_count')
  end
end
