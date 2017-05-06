class Showrun < ApplicationRecord
  belongs_to :showblog, inverse_of: :showruns
  belongs_to :user
  validates :user_id, presence: true
  validates :event, numericality: {greater_than_or_equal_to: 10, 
                            less_than_or_equal_to: 300,
                            message: "must be between 10 and 300 events, look 
                            on your home page to see how many your player makes."
                            
                            }

  validates :amt, numericality:  {greater_than_or_equal_to: 1,
                            less_than_or_equal_to: 100,
                            message: "must be at least 1 level not more than 
                            100 levels, at a level half your events this is 40 
                            shows per level."}                    
  
 
  
  
  
  
  
  
  
  
end
  
  
  
  
  
  
  
  

