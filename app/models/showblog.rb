class Showblog < ApplicationRecord
  belongs_to :user
  has_many :showruns, dependent: :destroy
  
 validates :user_id, presence: true
 validates :name, presence: true,
                    length: { minimum: 5 }
  
  
end
