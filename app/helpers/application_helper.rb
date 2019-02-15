module ApplicationHelper

  def page_title
    title = t('view.site_title')
    title = @page_title + ' | ' + title if @page_title
    title
  end

  def devise_error_messages
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join

    html = <<-HTML
    <div class="notification is-danger">
      #{messages}
    </div>
    HTML

    html.html_safe
  end

end
