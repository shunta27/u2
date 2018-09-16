class PostDecorator < Draper::Decorator
  delegate_all

  def reply_count
    object.reply_count
  end

  def created_at_view
    l(object.created_at, format: :YMD) if object.created_at.present?
  end

end
