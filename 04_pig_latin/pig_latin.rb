# pig latin rules:
# if word begins with a vowel sound, add an "ay" to end of word
# if word begins with consonant sound, 
# then move it to the end of a word and add "ay" to end of word

def translate phrase
  vowels = /[aeiou]/
  phoneme = %w(sch, qu)

  phrase = phrase.split(' ').each_with_index.map do |word, index|
    vowel_index = word.index(vowels)
    first_bit = word[0, vowel_index]

    if phoneme.any? { |ph| word.index(ph) != nil }
      matched = phoneme[phoneme.find_index{ |ph| word.index(ph) != nil }]
      phoneme_end = word.index(matched) + matched.length
      first_bit = word[0, phoneme_end]
      word = word[phoneme_end..-1] + first_bit + 'ay'
    elsif first_bit.match(vowels) != nil
      word = word << 'ay'
    elsif first_bit.match(vowels) == nil
      word = word[vowel_index..-1] + first_bit + 'ay'
    end

  end

  phrase.join(' ')

end
