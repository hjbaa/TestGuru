# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create
  before_update :set_next_question

  PASSAGE_THRESHOLD = 85

  def success?
    correct_percentage > PASSAGE_THRESHOLD
  end

  def correct_percentage
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  private

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def set_next_question
    self.current_question = next_question
  end
end
