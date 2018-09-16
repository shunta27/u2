class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user,  index: true, foreign_key: true
      t.references :post,  index: true, foreign_key: true

      t.text :body, null: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
