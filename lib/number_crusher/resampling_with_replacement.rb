module NumberCrusher
  def ResamplingWithReplacement(numbers = nil, samples: 1)
    function = ResamplingWithReplacement.new(samples: samples)
    numbers ? function.call(numbers) : function
  end

  class ResamplingWithReplacement
    def initialize(samples: 1)
      @samples = samples
    end

    def call(numbers)
      return [] if @samples <= 0
      n = numbers.to_a
      (1..@samples).lazy.map { Array.new(n.size) { n.sample } }
    end
  end
end
