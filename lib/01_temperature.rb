ratio = (9.0 / 5.0)
diff = 32.0

define_method :ftoc do |degrees|
  degrees -= diff
  degrees /= ratio
  degrees.round
end

define_method :ctof do |degrees|
  degrees *= ratio
  degrees += diff
  degrees
end
