class Book
  attr_accessor :title
  def title
    special_words = %w(the a an and nor in the of)
    str = @title.split(' ')
    str = str.each_with_index.map do |w, i|
      # if a word is found in the special_words array, proceed to check index
      if special_words.any? {|x| w == x}
        # if index == 0, capitalize w, otherwise leave it as it is
        w = i == 0 ? w.capitalize : w
      # if word is NOT found in special_words array, capitalize it
      else
        w.capitalize
      end
    end
    @title = str.join(' ')
  end
end
