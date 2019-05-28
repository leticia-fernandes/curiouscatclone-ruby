class ChangeColumnsNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :question, :content
    rename_column :answers, :answer, :content
  end
end
