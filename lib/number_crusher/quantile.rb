module NumberCrusher
  def Quantile(numbers = nil, quant:)
    function = Quantile.new(quant: quant)
    numbers ? function.call(numbers) : function
  end

  class Quantile
    def initialize(quant:)
      unless (0.0..1.0).include?(quant)
        fail %(Expect quant: between 0.0 and 1.0 (inclusive), got "#{quant}")
      end
      @quant = quant
    end

    def call(numbers)
      return nil if numbers.empty?
      sorted = numbers.sort
      return sorted.first if @quant == 0
      return sorted.last if @quant == 1

      quantile(numbers)
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
