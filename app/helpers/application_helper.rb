module ApplicationHelper
  def lnil(date)
    date.nil? ? 'не указано' : l(date)
  end
  
  def breadcrumb_tag(&block)
    render 'application/breadcrumb', block: capture(&block)
  end

  def check_sudo()
  	return @current_role_user.try("is_admin?")
  end

end

