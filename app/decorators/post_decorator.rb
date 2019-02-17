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

  def user_avatar_icon_url
    return 'https://main-ichikawa-net.ssl-lolipop.jp/u2/images/dummy128.png' if object.user.nil?
    object.user.avatar_icon_url
  end

end
