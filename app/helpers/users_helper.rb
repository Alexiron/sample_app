module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50, alternative: ""})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    options[:alternative].blank? ? alternative = user.name : alternative = options[:alternative].to_s
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: alternative, class: "gravatar")
  end
end
