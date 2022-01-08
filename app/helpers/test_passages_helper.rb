# frozen_string_literal: true

module TestPassagesHelper
  def correct_percentage(test_passage)
    (test_passage.correct_questions.to_f / test_passage.test.questions.count * 100).round
  end

  def current_question_number(test_passage)
    test_passage.test.questions.ids.sort.find_index(test_passage.current_question.id) + 1
  end
end
