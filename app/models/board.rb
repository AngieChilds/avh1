class Board < ApplicationRecord
 validates :user_id, presence: true
  has_and_belongs_to_many :users, foreign_key: :user_id, primary_key: :player
  
  
  
  
  
  
  has_many :comments
  
 
end
