class BlogPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog


  def unique_words_by_word_count
    words_by_word_count = (self.unique_words.to_f)/(self.word_count.to_f)
  end

end
