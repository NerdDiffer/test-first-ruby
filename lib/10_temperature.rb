class Temperature
  @ratio = (9.0 / 5.0)
  @diff = 32

  def initialize(options = {})
    options.each { |name, value| instance_variable_set "@#{name}", value }
  end

  def self.from_celsius(degrees)
    new(:c => degrees)
  end

  def self.from_fahrenheit(degrees)
    new(:f => degrees)
  end

  def self.ftoc(degrees)
    degrees -= @diff
    degrees /= @ratio
  end
  
  def self.ctof(degrees)
    degrees *= @ratio
    degrees += @diff
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
