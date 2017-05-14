class Story < ApplicationRecord
  belongs_to :comp, inverse_of: :stories
  has_many :votes, dependent: :destroy
  belongs_to :user
  validates  :user_id, presence: true
   
  validates :title, presence: true, length: { minimum: 4 }
  validates :text, presence: true, length: { minimum: 50 }
  
  def my_downvote
  
  
  unless votes.empty?
  votes.first.destroy
  end

end
  
  
  
end
