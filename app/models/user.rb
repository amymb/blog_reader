class User < ActiveRecord::Base
  has_secure_password
  has_one :blog

  def wordpress_user_id
    WordpressAPI.new.username_to_id(self.blog.url.downcase, self.wordpress_username.downcase)
  end


end
