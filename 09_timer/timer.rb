class Timer
  attr_accessor :seconds

  SECONDS_IN_HOUR = 3600

  def initialize
    @seconds = 0
  end

  def time_string
    hh = @seconds / SECONDS_IN_HOUR
    mm = @seconds % SECONDS_IN_HOUR / 60
    ss = @seconds % SECONDS_IN_HOUR % 60
    sprintf("%02d:%02d:%02d", hh, mm, ss)
  end

  def padded num
    num = num.to_s
    num.length < 2 ? num.prepend('0') : num
  end
end
