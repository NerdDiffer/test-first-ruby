class Array
  def sum
    self.inject(0) {|total, curr| total += curr}
  end

  def square
    self.map {|val| val * val}
  end
  def square!
    self.map! {|val| val * val}
  end
end
