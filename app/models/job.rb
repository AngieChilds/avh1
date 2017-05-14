class Job < ApplicationRecord
  belongs_to :comp, inverse_of: :jobs
  validates :text, presence: true, length: { minimum: 4 }
  belongs_to :user
  validates  :user_id, presence: true
end
