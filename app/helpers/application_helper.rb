module ApplicationHelper
  def debug_props
    {
      :current_user => current_user ? current_user.email : 'nil'
    }
  end
end
