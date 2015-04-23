module NumberCrusher
  class Component
    include Enumerable

    def initialize(function: nil, data: [])
      @function = function
      @data = data
    end

    def >>(function)
      Component.new(function: function, data: self)
    end

    def each(&block)
      pr = @function ? @function.to_proc : nil
      if pr && pr.arity == 2
        e = Emitter.new(block)
        @data.each { |v| pr.call(v, e) }
      elsif pr && pr.arity == 1
        @data.each { |v| block.call(pr.call(v)) }
      elsif pr && pr.arity == 0
        @data.each { |v| block.call(pr.call) }
      elsif pr.nil?
        @data.each { |v| block.call(v) }
      else
        fail "Received wrong block. It need to have arity 0, 1 or 2"
      end
    end
  end

  class Emitter
    def initialize(block)
      @block = block
    end

    def emit(value)
      @block.call(value)
    end
  end
end
