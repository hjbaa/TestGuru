class AddAnswerNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :question_id, false)
  end
end
