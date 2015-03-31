module EnglishNumber
  CARDINAL = {
    ones: %w(zero one two three four five six seven eight nine),
    ten_to_twenty: %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen),
    mults_of_ten: %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
  }

  def get_scope_word()
    length = self.to_s.length
    return if length <= 3
    return 'thousand' if length >= 4 && length < 7
    return 'million'  if length >= 7 && length < 10
    return 'billion'  if length >= 10 && length < 13
    return 'trillion' if length >= 13
  end

  def group_by(x)
    num_str = self.to_s
    grouped = []
    while num_str.length > 0
      num_str.length < x ?
        group = num_str.slice!(0..num_str.length) :
        group = num_str.slice!(-x..-1)
      grouped.unshift(group)
    end
    grouped
  end
end

class Fixnum
  include EnglishNumber

  def floor_to_nearest(n = 10)
    (self / n).round * n
  end

  def build_str(lower_bound)
    if self % lower_bound == 0
      ind = self / lower_bound
      "#{ind.in_words} #{get_scope_word}"
    else
      num_str = []
      larger = floor_to_nearest(lower_bound)
      num_str << larger.in_words

      j = 1
      groups = group_by(3)

      while j < groups.length
        smaller = groups[j].to_i
        if smaller == 0
          j += 1
          next
        end
        if j == groups.length - 1
          num_str << "#{smaller.in_words}"
        else
          dist_to_last = groups.length - 1 - j
          floored = groups[j]
          dist_to_last.times { floored << '000' }
          floored = floored.to_i
          num_str << "#{smaller.in_words} #{floored.get_scope_word}"
        end
        j += 1
      end
      num_str.join(' ')
    end
  end

  def in_words
    n = self

    case
    when n < 10
      CARDINAL[:ones][n]
    when n >= 10 && n < 20
      ind = n - 10
      CARDINAL[:ten_to_twenty][ind]
    when n >= 20 && n < 100
      if n % 10 == 0
        ind = (n / 10) - 1
        CARDINAL[:mults_of_ten][ind]
      else
        tens = floor_to_nearest
        ones = self - tens
        "#{tens.in_words} #{ones.in_words}"
      end
    when n >= 100 && n < 1000
      if n % 100 == 0
        ind = n / 100
        "#{ind.in_words} hundred"
      else
        hundreds = floor_to_nearest(100)
        tens = group_by(2).last.to_i
        "#{hundreds.in_words} #{tens.in_words}"
      end
    when n >= 1_000
      # `when` clauses must be presented in ascending order
      case
      when n < 1_000_000
        build_str(1_000)
      when n < 1_000_000_000
        build_str(1000000)
      when n < 1_000_000_000_000
        build_str(1_000_000_000)
      when n < 1_000_000_000_000_000
        build_str(1_000_000_000_000)
      end
    end
  end

end
