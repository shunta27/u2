class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.references :user,  index: true, foreign_key: false
      t.references :category,  index: true, foreign_key: false

      t.string :subject, null: false, default: ""
      t.text :body, null: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
