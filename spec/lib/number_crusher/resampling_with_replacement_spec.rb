require "spec_helper"

describe ResamplingWithReplacement do
  it "returns empty if zero (or negative) resamplings" do
    expect(ResamplingWithReplacement([1, 2, 3], samples: 0)).to eq []
    expect(ResamplingWithReplacement([1, 2, 3], samples: -1)).to eq []
  end

  context "with default parameter (1 resample)" do
    subject { ResamplingWithReplacement([1, 2, 3]) }
    it "returns ONE resampling" do
      expect(subject.size).to eq 1
    end

    it "randomize numbers with replacement" do
      samples = (1..100).map { ResamplingWithReplacement([1, 2, 3]).first }
      expect(samples.all? { |s| s.size == 3 }).to be_truthy
      expect(samples.any? { |s| s != [1, 2, 3] }).to be_truthy
      expect(samples.all? { |s| s.include?(3) }).to be_falsey
      expect(samples.all? { |s| s.include?(2) }).to be_falsey
      expect(samples.all? { |s| s.include?(1) }).to be_falsey

      average_of_sums = samples.
        map { |v| v.reduce(0) { |a, e| a + e } }.
        reduce(0) { |a, e| a + e } / samples.size.to_f
      expect(average_of_sums).to be_between(5.5, 6.5).inclusive
    end
  end

  context "with more samples" do
    it "randomize numbers with replacement" do
      samples = ResamplingWithReplacement([1, 2, 3], samples: 100)
      expect(samples.all? { |s| s.size == 3 }).to be_truthy
      expect(samples.any? { |s| s != [1, 2, 3] }).to be_truthy
      expect(samples.all? { |s| s.include?(3) }).to be_falsey
      expect(samples.all? { |s| s.include?(2) }).to be_falsey
      expect(samples.all? { |s| s.include?(1) }).to be_falsey

      average_of_sums = samples.
        map { |v| v.reduce(0) { |a, e| a + e } }.
        reduce(0) { |a, e| a + e } / samples.size.to_f
      expect(average_of_sums).to be_between(5.5, 6.5).inclusive
    end
  end
end
