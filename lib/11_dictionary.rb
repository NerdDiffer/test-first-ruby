class Dictionary
  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    if entry.class == Hash
      key = entry.keys[0]
      val = entry.values[0]
      @entries[key] = val
    end
    @entries[entry] = nil if entry.class == String
  end

  def keywords
    @entries.keys.sort
  end

  def include?(x)
    keywords.include?(x)
  end

  def find(x)
    @entries.select { |e| e.include?(x) }
  end

  def printable
    keywords.map do |key|
      val = @entries[key]
      "[#{key}] \"#{val}\""
    end.join("\n")
  end

end
