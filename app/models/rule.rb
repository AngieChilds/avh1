class Rule < ApplicationRecord
  belongs_to :comp, inverse_of: :rules
  belongs_to :user
  validates  :user_id, presence: true
end
