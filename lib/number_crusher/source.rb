module NumberCrusher
  class Component
    include Enumerable

    def initialize(function: nil, data: [])
      @function = function
      @data = data
    end

    def >>(function)
      Component.new(function, self)
    end

    def each
      if function
        data.each { |v| yield function.call(v) }
      else
        data.each { |v| yield v }
      end
    end
  end
end
