class Category < ActiveRecord::Base
  acts_as_paranoid

  has_one :post
  has_one :reply

  private

  def self.default_order
    order('sort_num ASC')
  end
end
