module NumberCrusher
  def BootstrappedConfidenceInterval(numbers = nil, confidence: 0.95)
    function = BootstrappedConfidenceInterval.new(confidence: confidence)
    numbers ? function.call(numbers) : function
  end

  class BootstrappedConfidenceInterval
    PRECISION = 4
    UNIT = 10**PRECISION
    def initialize(confidence: 0.95)
      conf = (confidence * UNIT).to_i
      lower_quant = (UNIT - conf) / 2
      @lower_quantile = lower_quant / UNIT.to_f
      @upper_quantile = (UNIT - lower_quant) / UNIT.to_f
    end

    def call(numbers)
      [Quantile(numbers, quant: @lower_quantile),
       Quantile(numbers, quant: @upper_quantile)]
    end
  end
end
