class HomeController < ApplicationController

  def index
    @posts = PostDecorator.decorate_collection(Post.default_order.limit(6))
  end

  def about; end
  # def help; end
  # def terms; end
  # def privacy; end
end
