# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    question.new_record? ? "Create new #{@question.test.title} question" : "Edit #{question.test.title} question"
  end
end
