require "spec_helper"

describe ConfidenceInterval do
  it_behaves_like "a Functor"

  let(:sample) { (1..999).to_a }

  context "with default confidence (0.95)" do
    subject { ConfidenceInterval(sample) }
    it { is_expected.to eq [25, 975] }
  end
end
