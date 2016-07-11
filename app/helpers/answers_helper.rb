module AnswersHelper
  def relevant_answers(question_id)
    Answer.where(question_id: question_id).pluck(:text)
  end

  def any_answer?(question_id)
    Answer.find_by(question_id: question_id)
  end
end
