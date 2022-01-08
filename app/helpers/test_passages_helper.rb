# frozen_string_literal: true

module TestPassagesHelper
  def current_question_number(test_passage)
    test_passage.test.questions.ids.sort.find_index(test_passage.current_question.id) + 1
  end
end
