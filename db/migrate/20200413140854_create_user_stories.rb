class CreateUserStories < ActiveRecord::Migration[6.0]
  def change
    create_table :user_stories do |t|
      t.string :actor
      t.string :goal
      t.string :reason
      t.text :criteria
      t.integer :priority
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
