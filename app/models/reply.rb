class Reply < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :post
end
