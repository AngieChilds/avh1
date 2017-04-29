class Board < ApplicationRecord
 validates :user_id, presence: true
 
  
  
  
  
  has_many :comments
  
 
end
