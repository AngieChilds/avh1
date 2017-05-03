class Board < ApplicationRecord
 has_many :comments, dependent: :destroy
 validates :user_id, presence: true
 validates :title, presence: true,
                    length: { minimum: 5 }
  
  
  
  
  
  
 
end
