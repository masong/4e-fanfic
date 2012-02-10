module ApplicationHelper
  def is_current_page?
    return (params[:controller] == 'stories' and params[:action] == 'current')
  end

  def is_archive_page?
    return (params[:controller] == 'stories' and params[:action] == 'index')
  end

  def is_about_page?
    return (params[:controller] == 'about' and params[:action] == 'index')
  end

  def is_admin_page?
    return (params[:controller] == 'admin' and params[:action] == 'index')
  end
end
