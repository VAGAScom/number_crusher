module NumberCrusher
  class Average
    class << self
      def calc(an_array)
        an_array.reduce(0) { |a, b| a + b } / an_array.size.to_f
      end

      def to_proc
        ->(a) { calc(a) }
      end
    end
  end
end
