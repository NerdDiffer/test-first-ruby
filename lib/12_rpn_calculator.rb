class RPNCalculator

  attr_reader :value

  def initialize
    @contents = []
  end

  def push(val)
    @contents.push(val)
  end

  def plus
    do_math {|nums| nums[0] + nums[1]}
  end

  def times
    do_math {|nums| nums[0] * nums[1]}
  end

  def minus
    do_math {|nums| nums[1] - nums[0]}
  end

  def divide
    do_math {|nums| nums[1].to_f / nums[0].to_f}
  end

  def tokens str
    str = str.split(' ')
    str.map { |n| n.match(/\d/) ? n.to_i : n.to_sym }
  end

  def evaluate str
    str_tokens = tokens(str)

    str_tokens.each_with_index do |token, ind|
      unless [:+, :-, :*, :/].include? token
        self.push(token)
      else
        case token
        when :+ then operation = plus
        when :* then operation = times
        when :- then operation = minus
        when :/ then operation = divide
        end
        return operation if ind == str_tokens.length - 1
      end
    end
  end

  private

  def do_math
    operands = pop_two_operands()
    result = yield(operands)
    push_item_then_return_it(result)
  end

  def push_item_then_return_it item
    @contents.push(item)
    @value = item
  end

  def pop()
    raise "calculator is empty" if @contents.empty?
    @contents.pop()
  end

  def pop_two_operands
    [pop, pop]
  end

end
