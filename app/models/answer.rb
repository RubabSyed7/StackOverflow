class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  validates :user, presence: true
  validates :question, presence: true
  validates_associated :user
  validates_associated :question
end
