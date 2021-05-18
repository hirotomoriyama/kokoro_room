class AddBestAnswerIdToProblems < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :best_answer_id, :integer
  end
end
