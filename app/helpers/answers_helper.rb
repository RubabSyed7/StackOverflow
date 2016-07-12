module AnswersHelper
  def relevant_answers(q_id)
    Answer.where(question_id: q_id)
  end

  def any_answer?(question_id)
    Answer.find_by(question_id: question_id)
  end

  def accept?(answer)
  	current_user.id == answer.question.user_id
  end
end
