module Importer
  class WordCount
    def initialize(blog_post_id, content)
      @content = content
    end

    def finalize!
      flesch_kincaid_grade = Odyssey.flesch_kincaid_grade_level(@content, false)
      BlogPost.find(blog_post_id).update!(flesch_kincaid_grade: flesch_kincaid_grade)
    end
  end
end
