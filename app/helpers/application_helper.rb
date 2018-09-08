module ApplicationHelper
  def page_title
    title = 'U2トーク'
    title = @page_title + ' | ' + title if @page_title
    title
  end
end
