namespace :populate_blog_posts do
  desc 'Add blog posts info to blog posts table'
  task populate_blog_posts: :environment do
    users = User.all
    users.each do |user|
      if user.blog
        user_blog_posts = WordpressAPI.new.post_info_for_author(user.blog.url, user.wordpress_user_id)
        if user_blog_posts
          user_blog_posts.each do |blog_post|
            BlogPost.create!(title: blog_post[:title], content: blog_post[:content], date: blog_post[:date], user_id: user.id, blog_id: user.blog.id)
          end
        end
      end
    end
  end
end
