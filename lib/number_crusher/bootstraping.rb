module NumberCrusher
  def Bootstraping(numbers = nil, function:, samples: 1000)
    function = Bootstraping.new(function: function, samples: samples)
    numbers ? function.call(numbers) : function
  end

  class Bootstraping
    def initialize(function:, samples: 1000)
      @function, @samples = function, samples
    end

    def call(numbers)
      ResamplingWithReplacement(numbers, samples: @samples).
        map { |n| @function.call(n) }
    end
  end
end
