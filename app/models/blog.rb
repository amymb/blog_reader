class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :blog_posts
  after_create :add_wordpress_id

  def add_wordpress_id
    if self.user.wordpress_username && self.url
      self.user.update_attributes(wordpress_user_id: self.user.wordpress_user_id_lookup)
    end
  end
end
