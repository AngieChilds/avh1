class Showblog < ApplicationRecord
  belongs_to :user
  has_many :showruns, inverse_of: :showblog
  validates_associated :showruns
  accepts_nested_attributes_for :showruns, allow_destroy: true
  
 validates :user_id, presence: true
 validates :name, presence: true,
                    length: { minimum: 5 }
  
  
end
