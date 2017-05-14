class Prize < ApplicationRecord
  belongs_to :comp, inverse_of: :prizes
  belongs_to :user
  validates  :user_id, presence: true
end
