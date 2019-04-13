class User < ApplicationRecord
  acts_as_paranoid

  has_many :post

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :profile_text, length: { maximum: 1000 }

  def avatar_icon_url
    unless avatar?
      return 'https://main-ichikawa-net.ssl-lolipop.jp/u2/images/dummy128.png'
    end
    avatar.thumb.url
  end

end
