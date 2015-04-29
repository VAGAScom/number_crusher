require "spec_helper"

describe BootstrappedConfidenceInterval do
  it_behaves_like "a Functor"

  let(:sample) { 1..999 }
  let(:median) { Quantile(quant: 0.5) }

  context "with default confidence (0.95)" do
    subject { BootstrappedConfidenceInterval(sample, function: median) }
    it do
      is_expected.to match [
        be_within(50).of(500) & (be < 500),
        be_within(50).of(500) & (be > 500)]
    end
  end
end
