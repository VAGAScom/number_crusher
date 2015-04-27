module NumberCrusher
  def Quantile(numbers, quant:)
    fail %(Expect quant: between 0.0 and 1.0 (inclusive), got "#{quant}") unless (0.0..1.0).include?(quant)
    return nil if numbers.empty?
    sorted = numbers.sort
    return sorted.first if quant == 0
    return sorted.last if quant == 1

    size = numbers.size
    quantile_index = size * quant
    if quantile_index == quantile_index.to_int
      (sorted[quantile_index.ceil - 1] + sorted[quantile_index.ceil]) / 2.0
    else
      sorted[quantile_index.ceil - 1]
    end
  end

  class Quantile
  end
end
