class AddAvatarUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :text, :after => :email
  end
end
