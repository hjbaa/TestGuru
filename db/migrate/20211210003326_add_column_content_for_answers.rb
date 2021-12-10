class AddColumnContentForAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column(:answers,:content, :string)
    change_column_null(:answers, :content, false)
  end
end
