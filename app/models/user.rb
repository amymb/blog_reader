class User < ActiveRecord::Base
  has_secure_password
  has_one :blog
  has_many :blog_posts


  def wordpress_user_id_lookup
    WordpressAPI.new.username_to_id(self.blog.url.downcase, self.wordpress_username.downcase)
  end

  def total_words
    self.blog_posts.reduce(0){|sum, blog_post| sum + blog_post.word_count}
  end

  def unique_words_per_total_words
    (self.blog_posts.reduce(0){|sum, blog_post| sum + blog_post.unique_words.to_f})/(self.total_words.to_f)
  end

  def flesch_kincaid_avg
    (self.blog_posts.reduce(0){|sum, blog_post| sum + blog_post.flesch_kincaid_grade})/self.blog_posts.count
  end

  def avg_total_words
    users = []
    User.all.each do |user|
      if user.total_words < 8000
        users << user
      end
    end
    (users.reduce(0) {|sum, user| sum + user.total_words})/(users.count)
  end

  def avg_unique_words_per_total_words
    users = User.all
    (users.reduce(0) {|sum, user| sum + user.unique_words_per_total_words})/(users.count)
  end

  def avg_flesch_kincaid
    users = []
    User.all.each do |user|
      if user.flesch_kincaid_avg < 17
        users << user
      end
    end
    (users.reduce(0){|sum, user| sum + user.flesch_kincaid_avg})/(users.count)
  end


end
