require "spec_helper"

describe ResamplingWithReplacement do
  it_behaves_like "a Functor"

  let (:sample) { [1, 2, 3] }

  matcher :average_of_sums_between do |lower, upper|
    match do |actual|
      average_of_sums = actual.map { |v| v.reduce(0, :+) }.reduce(0, :+) / actual.size.to_f
      (lower..upper).include?(average_of_sums)
    end
  end

  matcher :be_randomized_with_replacement do |expect|
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

  context "with zero resamplings" do
    subject { ResamplingWithReplacement(sample, samples: 0) }
    it { is_expected.to have(0).items }
  end

  context "with default parameter (1 resample)" do
    subject { ResamplingWithReplacement(sample) }

    it { is_expected.to have(1).items }

    it "should randomize  with replacement" do
      samples = (1..200).map { subject.first }
      expect(samples).to be_randomized_with_replacement
    end
  end

  context "with more samples" do
    subject { ResamplingWithReplacement(sample, samples: 200) }
    it { is_expected.to be_randomized_with_replacement }
  end
end
