class Dictionary
  attr_reader :entries

  def initialize
    @entries ||= {}
  end

  def add(entry)
    return ArgumentError unless entry.class == Hash
    print entry
    puts
    @entries[entry[:name]] = entry[:value]
  end
end
