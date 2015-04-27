module NumberCrusher
  def Average(numbers) # :rubocop: all
    numbers.reduce(0) { |a, e| a + e } / numbers.size.to_f
  end

  class Average
    def self.call(numbers)
      Average(numbers)
    end
  end
end
