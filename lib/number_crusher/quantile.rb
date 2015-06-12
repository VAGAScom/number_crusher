module NumberCrusher
  def Quantile(numbers = nil, quant:, sorted: false)
    function = Quantile.new(quant: quant, sorted: sorted)
    numbers ? function.call(numbers) : function
  end

  class Quantile
    using EnumeratorExtension

    def initialize(quant:, sorted: false)
      unless (0.0..1.0).include?(quant)
        fail %(Expect quant: between 0.0 and 1.0 (inclusive), got "#{quant}")
      end
      @quant = quant
      @sorted = sorted
    end

    def call(numbers)
      return nil if numbers.empty?
      sorted = @sorted ? numbers : numbers.sort
      return sorted.first if @quant == 0
      return sorted.last if @quant == 1

      quantile(sorted)
    end

    private

    def quantile(numbers)
      quantile_index = numbers.size * @quant
      index = quantile_index.ceil
      if quantile_index == quantile_index.to_int
        (numbers[index - 1] + numbers[index]) / 2.0
      else
        numbers[index - 1]
      end
    end
  end
end
