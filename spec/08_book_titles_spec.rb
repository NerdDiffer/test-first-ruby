# # Book Titles
#
# # Topics
#
# * classes and objects
# * instance variables
# * setter methods
# * strings
#
# # Notes
#
# Book Titles in English obey some strange capitalization rules. For example, "and" is lowercase in "War and Peace". This test attempts to make sense of some of those rules.
#

require '08_book_titles'

describe Book do

  before do
    @book = Book.new
  end
  puts @book.class
  describe 'title' do
    it 'should capitalize the first letter' do
      @book.title = "inferno"
      @book.title.should == "Inferno"
    end

    it 'should capitalize every word' do
      @book.title = "stuart little"
      @book.title.should == "Stuart Little"
    end

    describe 'should capitalize every word except...' do
      describe 'articles' do
        specify 'the' do
          @book.title = "alexander the great"
          @book.title.should == "Alexander the Great"
        end

        specify 'a' do
          @book.title = "to kill a mockingbird"
          @book.title.should == "To Kill a Mockingbird"
        end

        specify 'an' do
          @book.title = "to eat an apple a day"
          @book.title.should == "To Eat an Apple a Day"
        end
      end # end articles

      describe 'conjunctions' do
        specify 'and' do
          @book.title = "war and peace"
          @book.title.should == "War and Peace"
        end
        specify 'nor' do
          @book.title = "neither here nor there"
          @book.title.should == "Neither Here nor There"
        end
      end

      describe 'prepositions' do
        specify 'in, the, of' do
          @book.title = "love in the time of cholera"
          @book.title.should == "Love in the Time of Cholera"
        end
      end
    end

    describe 'should always capitalize...' do
      specify 'I' do
        @book.title = "what i wish i knew when i was 20"
        @book.title.should == "What I Wish I Knew When I Was 20"
      end

      specify 'the first word' do
        @book.title = "the man in the iron mask"
        @book.title.should == "The Man in the Iron Mask"
      end
    end
  end
end
