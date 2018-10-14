class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.references :user,  index: true, foreign_key: false
      t.references :post,  index: true, foreign_key: false

      t.text :body, null: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
