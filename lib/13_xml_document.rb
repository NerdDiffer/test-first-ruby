class XmlDocument
  def method_missing(action, *args, &block)
    if block_given?
      return "<#{action}>#{yield}</#{action}>"
    end

    if args.length == 0
      return "<#{action}/>"
    else
      return "<#{action} #{extract_attr(*args)}/>"
    end
  end

  def extract_attr(*args)
    pair = args[0]
    key = pair.keys.join('').to_s
    val = pair.values.join('')
    "#{key}='#{val}'"
  end

end
