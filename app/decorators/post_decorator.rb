class PostDecorator < Draper::Decorator
  delegate_all

  def reply_count
    object.reply_count
  end

  def body_view
    h.simple_format(object.body)
  end

  def created_at_view
    l(object.created_at, format: :YMD)
  end

  def not_exist_post_user
    '退会済みユーザ'
  end

end
