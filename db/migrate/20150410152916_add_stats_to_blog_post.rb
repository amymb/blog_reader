class AddStatsToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :flesch_kincaid_grade, :float
    add_column :blog_posts, :suggestions, :integer
    add_column :blog_posts, :words_to_avoid, :integer
    add_column :blog_posts, :unique_words, :integer
    add_column :blog_posts, :word_count, :integer
    add_column :blog_posts, :blog_post_id, :integer
  end
end
