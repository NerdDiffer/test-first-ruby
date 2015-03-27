def reverser &block
  str = block.call.split(' ')
  str.map { |w| w.reverse }.join(' ')
end

def adder b = 1
  yield + b
end

def repeater n=1, &block
  n.times { block.call }
end
