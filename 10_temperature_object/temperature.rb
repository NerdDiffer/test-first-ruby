class Temperature
  def initialize options = {}
    options.each do |name, value|
      instance_variable_set "@#{name}", value
    end
  end

  def in_fahrenheit
    if self.instance_variable_defined?(:@c)
      Temperature.ctof(@c)
    elsif self.instance_variable_defined?(:@f)
      @f
    end
  end

  def in_celsius
    if self.instance_variable_defined?(:@f)
      Temperature.ftoc(@f) 
    elsif self.instance_variable_defined?(:@c)
      @c
    end
  end

  class << self
    alias :from_celsius :in_fahrenheit
  end

  def self.ftoc degrees_fahrenheit
    (degrees_fahrenheit - 32.0) * (5.0 / 9.0)
  end
  
  def self.ctof degrees_celsius
    (degrees_celsius * (9.0 / 5.0)) + 32.0
  end
end

class Celsius < Temperature
  def initialize degrees
    @c = degrees
  end
end

class Fahrenheit < Temperature
  def initialize degrees
    @f = degrees
  end
end
