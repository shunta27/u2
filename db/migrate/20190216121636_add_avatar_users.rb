class AddAvatarUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_url, :text, :after => :email
  end
end
