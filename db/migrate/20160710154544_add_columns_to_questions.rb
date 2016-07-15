class AddColumnsToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :title, :string
    add_column :questions, :text, :string
    add_column :questions, :selected_ans, :decimal
    add_reference :questions, :user, index: true
  end
end
