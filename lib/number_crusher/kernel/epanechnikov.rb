module NumberCrusher
  def Epanechnikov(x = nil)
    function = Epanechnikov.new
    x ? function.call(x) : function
  end

  class Epanechnikov
    def call(x)
      return 0 unless (-1..1).include?(x)
      0.75 * (1 - x**2)
    end
  end
end
