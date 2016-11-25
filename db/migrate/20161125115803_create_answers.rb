class CreateAnswers < ActiveRecord::Migration
  def change
    def change
      create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :body

      t.timestamps null: false
    end
  end
end
