def add a,b
  a + b
end

def subtract a,b
  a - b
end

def sum arr
  arr.inject(0) { |total, n| add(total, n) }
end

def multiply *nums
  nums.inject(1) {|total, n| total * n}
end

def power base, power
  base ** power
end

def factorial n
  return 1 if n == 0
  return factorial(n-1) * n
end

# when n = 1
# f(1-1) * 1 
# => f(0) * 1 
# => 1 * 1 => 1

# when n = 2
# f(2-1) * 2 
# => f(1) * 2 
# => f(0) * 2 
# => 1 * 2 => 2

# when n = 3
# f(3-1) * 3
# => f(2) * 3
# => 2 * 3 => 6
