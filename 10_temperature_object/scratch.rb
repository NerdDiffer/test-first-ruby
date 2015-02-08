class Foo
  def a; 'a'; end
  alias_method :alias_for_a, :a

  def self.b; 'b'; end
  class << self
    alias_method :alias_for_b, :b
  end
end

puts Foo.new.a
puts Foo.new.alias_for_a

puts Foo.b
puts Foo.alias_for_b
