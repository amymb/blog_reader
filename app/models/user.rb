class User < ActiveRecord::Base
  has_secure_password
  has_one :blog
  has_many :blog_posts


  def wordpress_user_id_lookup
    WordpressAPI.new.username_to_id(self.blog.url.downcase, self.wordpress_username.downcase)
  end



end
