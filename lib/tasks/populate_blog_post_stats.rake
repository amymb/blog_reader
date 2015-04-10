namespace :populate_stats do
  desc 'Update blog posts with fkg'
  task flesch_kincaid_grade: :environment do
    posts = BlogPost.all
    posts.each do |post|
      Rake::Task['populate_stats:flesh_kincaid_grade_singular'].invoke(post.id, post.content)
    end
  end

  task flesh_kincaid_grade_singular: :environment, [:blog_post_id, :content] do |t, args|
    Importer::WordCount.new(arg[:blog_post_id], arg[:content]).finalize!
  end

  task count_suggestions: :environment do
  end

  # desc 'Update blog posts with words to avoid count'
  # task ugly_words: :environment do
  #   posts = BlogPost.all
  #   posts.each do |post|
  #     post = post.content.split(" ")
  #     post.each do |word|
  #       word
  # end

  desc 'Update blog posts with word_count'
  task word_count: :environment do
    posts = BlogPost.all
    posts.each do |post|
      word_count = post.content.split(" ").count
      post.update!(word_count: word_count)
    end
  end


  desc 'Update blog posts with unique word count'
  task count_unique_words: :environment do
    posts = BlogPost.all
    posts.each do |post|
      unique_words = post.content.split(" ").uniq.count
      post.update!(unique_words: unique_words)
    end
  end



end
