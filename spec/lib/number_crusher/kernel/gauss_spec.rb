require "spec_helper"

describe Gauss do
  it_behaves_like "a Functor"

  subject { Gauss(n) }

  context "when n = 0" do
    let(:n) { 0 }
    it { is_expected.to be_within(0.0001).of(0.3989) }
  end

  context "when n = 1" do
    let(:n) { 1 }
    it { is_expected.to be_within(0.0001).of(0.1467) }
  end

  context "when n = -1" do
    let(:n) { -1 }
    it { is_expected.to be_within(0.0001).of(0.1467) }
  end
end
