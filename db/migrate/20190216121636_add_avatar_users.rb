class AddAvatarUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :avatar, :text, :after => :email
  end
end
