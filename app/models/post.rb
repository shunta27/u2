class Post < ActiveRecord::Base
  acts_as_paranoid

  has_one :user
  has_one :category
  has_many :replies

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :subject, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 2000 }
end
