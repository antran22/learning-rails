module UserHelper
  def gravatar_for(user, options = {})
    gravatar_id = Digest::MD5.hexdigest(user.email_address.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, **options)
  end
end
