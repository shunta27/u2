class Category < ActiveRecord::Base
  acts_as_paranoid

  has_one :post
  has_one :reply

  scope :default_order, -> { order(sort_num: :asc) }
end