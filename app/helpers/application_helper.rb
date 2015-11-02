module ApplicationHelper

  # Return pluralized title of current controller 
  def page_title
    params[:controller].classify.pluralize unless params[:controller] == 'pages'
  end
end
