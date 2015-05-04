module NumberCrusher
  def Gauss(x = nil)
    function = Gauss.new
    x ? function.call(x) : function
  end

  class Gauss
    def call(x)
      (1 / Math.sqrt(2 * Math::PI)) * (Math::E**((-1 / 2) * x**2))
    end
  end
end
