module ApplicationHelper
  def debug_props
    {
      :current_user => current_user ? current_user.email : 'nil'
    }
  end

  # Gravatar image
  def avatar(user, size=20)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    src = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    tag.img src: src, alt: user.email.downcase, class: "avatar rounded"
  end
end
