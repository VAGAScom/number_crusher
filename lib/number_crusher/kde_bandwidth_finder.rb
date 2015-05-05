module NumberCrusher
  def KdeBandwidthFinder(sample = nil, **options)
    function = KdeBandwidthFinder.new(**options)
    sample ? function.call(sample) : function
  end

  class KdeBandwidthFinder
    def initialize(function:, xs:, bandwidths:, finder:)
      @function = function
      @xs = xs
      @bandwidths = bandwidths
      @finder = finder
    end

    def call(sample)
      @bandwidths.bsearch do |width|
        k = KernelDensityEstimator(sample,
                                   function: @function,
                                   bandwidth: width,
                                   xs: @xs)
        @finder.call(k)
      end
    end
  end
end
