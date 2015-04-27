module NumberCrusher
  def ResamplingWithReplacement(numbers, samples: 1)
    return [] if samples <= 0
    (1..samples).map { Array.new(numbers.size) { numbers.sample } }
  end

  class ResamplingWithReplacement
    def self.call(numbers, samples: 1)
      ResamplingWithReplacement(numbers, samples)
    end
  end
end
