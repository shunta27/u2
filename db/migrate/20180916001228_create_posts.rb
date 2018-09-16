class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user,  index: true, foreign_key: true
      t.references :category,  index: true, foreign_key: true

      t.string :subject, null: false, default: ""
      t.text :body, null: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
