module NumberCrusher
  def KernelDensityEstimator(numbers = nil, **options)
    function = KernelDensityEstimator.new(**options)
    numbers ? function.call(numbers) : function
  end

  class KernelDensityEstimator
    using EnumeratorExtension

    def initialize(function:, bandwidth: 1, xs: nil)
      @function = function
      @bandwidth = bandwidth.to_f
      @xs = xs
    end

    def call(numbers)
      return [] if numbers.empty?
      @xs.map { |x| [x, kde(x, numbers)] }
    end

    private

    def kde(x, numbers)
      (1.0 / numbers.size * @bandwidth) *
        numbers.map { |xi| @function.call((x - xi) / @bandwidth) }.reduce(0, :+)
    end
  end
end
