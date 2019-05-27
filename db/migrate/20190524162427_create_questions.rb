class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question, null: false
      t.references :sender, foreign_key: { to_table: :users }
      t.references :addressee, foreign_key: { to_table: :users }
      t.boolean :anonymous, default: false

      t.timestamps
    end
  end
end
