class Category < ActiveRecord::Base
  acts_as_paranoid

  private

  def self.default_order
    order('sort_num ASC')
  end
end
