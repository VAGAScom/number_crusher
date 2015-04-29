require "spec_helper"

describe Bootstrapping do
  it_behaves_like "a Functor"

  let(:empty_sample) { [] }
  let(:median) { Quantile(quant: 0.5) }

  context "with default sample size" do
    subject { Bootstrapping(empty_sample, function: median) }
    it { is_expected.to have(1_000).items }
  end

  context "with 100 as sample size" do
    subject { Bootstrapping(empty_sample, function: median, samples: 100) }
    it { is_expected.to have(100).items }
  end

  context "median with sample [1, 2, 3]" do
    subject { Bootstrapping([1, 2, 3], function: median, samples: 1000) }
    it { is_expected.to have_more(2).than(1) & have_more(2).than(3) }
  end
end
