class Post < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :category
  has_many :replies

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :subject, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 2000 }

  private

  def self.default_order
    order('created_at DESC')
  end
end
