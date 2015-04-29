module NumberCrusher
  def Bootstrapping(numbers = nil, function:, samples: 1000)
    function = Bootstrapping.new(function: function, samples: samples)
    numbers ? function.call(numbers) : function
  end

  class Bootstrapping
    def initialize(function:, samples: 1000)
      @function, @samples = function, samples
    end

    def call(numbers)
      ResamplingWithReplacement(numbers, samples: @samples).
        map { |n| @function.call(n) }
    end
  end
end
