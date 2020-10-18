module ApplicationHelper
  def debug_props
    { :current_user => current_user.email }
  end
end
