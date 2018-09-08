module ApplicationHelper
  def page_title
    title = t('view.site_title')
    title = @page_title + ' | ' + title if @page_title
    title
  end
end
