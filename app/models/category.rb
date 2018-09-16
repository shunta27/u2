class Category < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :post
  belongs_to :reply

  private

  def self.default_order
    order('sort_num ASC')
  end
end
