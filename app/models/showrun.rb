class Showrun < ApplicationRecord
  belongs_to :showblog
  belongs_to :user
  validates :user_id, presence: true
 
  
  
  
end
