class ReplyDecorator < Draper::Decorator
  delegate_all

  def body_view
    h.simple_format(object.body)
  end

  def created_at_view
    l(object.created_at, format: :YMD)
  end

  def not_exist_reply_user
    '退会済みユーザ'
  end

end
