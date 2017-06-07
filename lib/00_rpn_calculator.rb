require "byebug"

class RPNCalculator
  # TODO: your code goes here!

  def initialize
    @array = []
  end

  def value
    @array.last
  end

  def push(num)
    @array.push(num)
  end

  def plus
    check_error

    @array << @array.pop + @array.pop
  end

  def minus
    check_error

    first = @array.pop
    second = @array.pop
    @array << second - first
  end

  def divide
    check_error

    first = @array.pop.to_f
    second = @array.pop.to_f
    @array << second / first
  end

  def times
    check_error
    
    @array << @array.pop * @array.pop
  end

  def tokens(string)
    numbers = ("0".."9")
    string.split.map do |el|
      numbers.include?(el) ? el.to_i : el.to_sym
    end
  end

  def check_error
    raise ("calculator is empty") if @array.size < 2
  end

  def evaluate(string)
    tokens(string).each do |el|
      if el == :+
        self.plus
      elsif el == :-
        self.minus
      elsif el == :*
        self.times
      elsif el == :/
        self.divide
      else
        self.push(el)
      end
    end
    self.value
  end


end

a = RPNCalculator.new
a.evaluate("1 2 3 * + 4 5 - /")
