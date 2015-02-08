def echo w
  w
end

def shout w
  w.upcase
end

def repeat2 w, n = 2
  n_greater_than_2 = Proc.new do
    a = ' ' + w
    (n-1).times { w << a }
  end
  n == 2 ?
    w.prepend(w + ' ') :
    n_greater_than_2.call
end

def repeat w, n = 2
  if n == 2
    w.prepend(w + ' ')
  else
    a = ' ' + w
    (n-1).times { w << a }
  end
  w 
end

def start_of_word w, n = 1
  w.slice(0, n)
end

def first_word w
  w.split(' ')[0]
end

def titleize w
  little_words = ['and', 'the', 'over']
  done = []
  w.split(' ').each_with_index do |x, i| 
    # if the word is a 'little word', then proceed to check the word's index
    if little_words.any? {|y| x == y}
      # if word is first word in string, then capitalize it
      # otherwise, leave it lower-case
      i == 0 ? x.capitalize! : x
      done.push(x)
    # if the word is NOT a 'little word', then capitalize the word
    else
      done.push(x.capitalize)
    end
  end
  # the previous block populates an array, so convert that array into a string
  done.join(' ')
end
