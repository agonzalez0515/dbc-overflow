class CreateVotes < ActiveRecord::Migration
  def change
    def change
      create_table :votes do |t|
      t.integer :user_id
      t.references :votable, polymorphic: true

      t.timestamps null: false
    end
  end
end
