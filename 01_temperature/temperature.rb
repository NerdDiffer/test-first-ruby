# converts degrees fahrenheit to degrees celsius
#
def ftoc degrees_fahrenheit
  (degrees_fahrenheit - 32.0) * (5.0 / 9.0)
end

def ctof degrees_celsius
  (degrees_celsius * (9.0 / 5.0)) + 32.0
end
