class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def self.relevant_comments(c_id, c_type)
  	Comment.where(commentable_id: c_id, commentable_type: c_type)
  end
end
