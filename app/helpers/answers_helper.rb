module AnswersHelper
  def relevant_answers(q_id)
    Answer.where(question_id: q_id)
  end

  def any_answer?(q_id)
    Answer.find_by(question_id: q_id)
  end
  
  def accepted?(question)
  	question.answers_id != nil
  end
end
