class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable, dependent: :destroy
  
  validates :user, presence: true
  validates :question, presence: true
end
