class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :email, :body

  validates :name, presence: true
  validates :email, presence: true
  validates :body, presence: true, length: { maximum: 1000 }
end