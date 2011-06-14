module HomeHelper
  def gravatar email
    require 'digest/md5'
    md5 = Digest::MD5.hexdigest(email)
    image_tag "http://gravatar.com/avatar/#{md5}.jpg?s=420"
  end
  def tip text, rel
    raw %(<a rel="##{rel}" class="tip">#{text}</a>)
  end

end