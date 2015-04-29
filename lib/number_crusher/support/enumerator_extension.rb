module NumberCrusher
  # Extensions for Enumerator
  #
  # Missing "#empty?" implemented
  module EnumeratorExtension
    refine Enumerator do
      def empty?
        !self.any?
      end
    end
  end
end
