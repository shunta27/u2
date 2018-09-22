class Reply < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :category
  belongs_to :post
  belongs_to :user

  validates :body, presence: true, length: { maximum: 1000 }
end
