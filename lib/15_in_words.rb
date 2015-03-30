module EnglishNumber
  CARDINAL = {
    ones: %w(zero one two three four five six seven eight nine),
    ten_to_twenty: %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen),
    mults_of_ten: %w(ten twenty thirty forty fifty sixty seventy eighty ninety),
    scale: %w(one ten hundred thousand million billion trillion),
  }
  def length
    str.length
  end
  def group_by(x)
    # using this class' private method `str`, leads to scope problems
    # and infinite loops. looking to improve this in the future, but using
    # `num_str = self.to_s` for now.
    num_str = self.to_s
    grouped = []
    while num_str.length > 0
      group = ''
      if num_str.length < x
        group = num_str.slice!(0..str.length)
      else
        group = num_str.slice!(-x..-1)
      end
      grouped.unshift(group)
    end
    grouped
  end

  private
  def str
    return self.to_s
  end
end

class Fixnum
  def floor_to_nearest(n = 10)
    (self / n).round * n
  end

  include EnglishNumber
  def in_words
    n = self

    build_str = Proc.new do |num, lower_bound, upper_bound, scope_word|
      if num % lower_bound == 0
        ind = num / lower_bound
        "#{ind.in_words} #{scope_word}"
      else
        bigger = floor_to_nearest(lower_bound)
        smaller = group_by(3).last.to_i
        "#{bigger.in_words} #{smaller.in_words}"
      end
    end

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
        tens = self.floor_to_nearest
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
    when n >= 1000
      case
      when n >= 1000 && n < 1000000
        build_str.call(n, 1000, 1000000, 'thousand')
      when n >= 1000000 && n < 1000000000
        build_str.call(n, 1000000, 1000000000, 'million')
      when n >= 1000000000 && n < 1000000000000
        build_str.call(n, 1000000000, 1000000000000, 'billion')
      end
    end
  end
end
