# frozen_string_literal: true

module QuestionsHelper
  def question_header(question, test_title)
    question.new_record? ? "Create new #{test_title} question" : "Edit #{test_title} question"
  end
end
