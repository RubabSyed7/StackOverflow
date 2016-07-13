class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  
  validates :user, presence: true
  validates :question, presence: true
  validates_associated :user
  validates_associated :question
end
