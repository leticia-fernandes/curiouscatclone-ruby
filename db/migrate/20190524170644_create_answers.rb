class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :answer, null: false
      t.references :question, foreign_key: true, null: false

      t.timestamps
    end
  end
end
