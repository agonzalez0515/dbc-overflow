class CreateComments < ActiveRecord::Migration
  def change
    def change
      create_table :comments do |t|
      t.integer :user_id
      t.string :body
      t.references :commentable, polymorphic: true

      t.timestamps null: false
    end
  end
end
