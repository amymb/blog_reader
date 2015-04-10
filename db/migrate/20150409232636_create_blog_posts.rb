class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.text :content
      t.text :title
      t.date :date
      t.integer :blog_id
      t.integer :user_id
    end
  end
end
