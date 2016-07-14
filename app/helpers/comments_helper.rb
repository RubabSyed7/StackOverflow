module CommentsHelper
	def relevant_comments(c_id, c_type)
		Comment.where(commentable_id: c_id, commentable_type: c_type)
	end

	def any_comments?(c_id, c_type)
		!(Comment.where(commentable_id: c_id, commentable_type: c_type).blank?)
	end
end