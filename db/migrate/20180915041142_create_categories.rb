class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: ""
      t.integer :sort_num, null: false, default: 0

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
