class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question, null: false
      t.integer :user_sender_id, null: false
      t.integer :user_addressee_id, null: false
      t.boolean :anonymous, default: false

      t.timestamps
    end
    add_foreign_key :questions, :users, column: :user_sender_id, primary_key: "id",  on_delete: :cascade
    add_foreign_key :questions, :users, column: :user_addressee_id, primary_key: "id",  on_delete: :cascade
  end
end
