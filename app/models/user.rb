class User < ActiveRecord::Base
  acts_as_paranoid

  has_many :post

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :profile_text, length: { maximum: 1000 }
end
