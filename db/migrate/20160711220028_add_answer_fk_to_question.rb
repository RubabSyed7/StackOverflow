class AddAnswerFkToQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :selected_ans
    add_reference :questions, :answers       #should've been :answer
  end
end
