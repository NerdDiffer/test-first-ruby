class Dictionary
  def initialize
    @entries ||= {}
  end

  def entries
    @entries
  end

  def add name, value = nil
    @entries[:name] = value
  end
end
