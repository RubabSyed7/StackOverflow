module AnswersHelper
  def relevant_answers
    Answer.where(question_id: @question.id)
  end

  def any_answer?
    Answer.find_by(question_id: @question.id)
  end

  def accepted?
  	@question.answers_id != nil
  end
end
