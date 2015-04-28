require "spec_helper"

describe ResamplingWithReplacement do
  matcher :average_of_sums_between do |lower, upper|
    match do |actual|
      average_of_sums = actual.map { |v| v.reduce(0, :+) }.reduce(0, :+) / actual.size.to_f
      (lower..upper).include?(average_of_sums)
    end
  end

  matcher :be_randomized do |expect|
    match do |actual|
      expect(actual).to \
        all(have_size(3)) &
        include([1, 2, 3]) &
        include(an_array_excluding(3)) &
        include(an_array_excluding(2)) &
        include(an_array_excluding(1)) &
        average_of_sums_between(5.5, 6.5)
    end
  end

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
      samples = (1..200).map { ResamplingWithReplacement([1, 2, 3]).first }
      expect(samples).to be_randomized
    end
  end

  context "with more samples" do
    it "randomize numbers with replacement" do
      samples = ResamplingWithReplacement([1, 2, 3], samples: 200)
      expect(samples).to be_randomized
    end
  end
end
