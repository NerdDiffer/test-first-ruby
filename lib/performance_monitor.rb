def measure n = 1, &block
  startTime = Time.now
  n.times { block.call }
  duration = (Time.now - startTime).to_f
  return n > 1 ? 
    duration / n :
    duration
end
