module NumberCrusher
  def ConfidenceInterval(numbers = nil, confidence: 0.95)
    function = ConfidenceInterval.new(confidence: confidence)
    numbers ? function.call(numbers) : function
  end

  class ConfidenceInterval
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
