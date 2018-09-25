class Comp < ApplicationRecord
   enum foo: {job: 1, story: 2} 
  belongs_to :user
  validates  :user_id, presence: true
  validates  :name, presence: true, length: { minimum: 4 }
   
  has_many :jobs,    inverse_of: :comp, dependent: :destroy
  has_many :stories, inverse_of: :comp, dependent: :destroy
  has_many :rules,   inverse_of: :comp, dependent: :destroy
  has_many :prizes,  inverse_of: :comp, dependent: :destroy
  
 
  
    
  validates_associated :jobs
  validates_associated :stories
  validates_associated :rules
  validates_associated :prizes
  
    
  accepts_nested_attributes_for :jobs, reject_if: proc { |attributes| attributes[:title].blank? }
  accepts_nested_attributes_for :stories, reject_if: proc { |attributes| attributes[:title].blank? }
  accepts_nested_attributes_for :rules, allow_destroy: true
  accepts_nested_attributes_for :prizes, allow_destroy: true
  
  
  
end
