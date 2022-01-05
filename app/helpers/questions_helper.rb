# frozen_string_literal: true

module QuestionsHelper
  def question_header(test, method = nil)
    if method
      "Create new #{test.title} question"
    else
      "Edit #{test.title} question"
    end
  end
end
