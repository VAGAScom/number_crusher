module NumberCrusher
  def BootstrappedConfidenceInterval(numbers = nil, **options)
    function = BootstrappedConfidenceInterval.new(**options)
    numbers ? function.call(numbers) : function
  end

  class BootstrappedConfidenceInterval
    PRECISION = 4
    UNIT = 10**PRECISION
    def initialize(function:, confidence: 0.95, samples: 1000)
      @function = function
      @samples = samples

      conf = (confidence * UNIT).to_i
      lower_quant = (UNIT - conf) / 2
      @lower_quantile = lower_quant / UNIT.to_f
      @upper_quantile = (UNIT - lower_quant) / UNIT.to_f
    end

    def call(numbers)
      boot = Bootstrapping(numbers, function: @function, samples: @samples)
      [Quantile(boot, quant: @lower_quantile),
       Quantile(boot, quant: @upper_quantile)]
    end
  end
end
