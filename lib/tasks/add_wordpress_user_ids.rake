namespace :add_wordpress_user_ids do
  desc 'Insert wordpress user ids into users table'
  task insert_wordpress_user_ids: :environment do
    users = User.all
    users.each do |user|
      user_id = user.wordpress_user_id
      user.update!(wordpress_user_id: user_id)
    end
  end
end
