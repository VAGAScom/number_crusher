require "spec_helper"

describe Epanechnikov do
  it_behaves_like "a Functor"

  subject { Epanechnikov(n) }

  context "when n = 0" do
    let(:n) { 0 }
    it { is_expected.to eq 0.75 }
  end

  context "when n = 1" do
    let(:n) { 1 }
    it { is_expected.to eq 0 }
  end

  context "when n = -1" do
    let(:n) { -1 }
    it { is_expected.to eq 0 }
  end

  context "when n > 1" do
    let(:n) { 1.0001 }
    it { is_expected.to eq 0 }
  end

  context "when n < -1" do
    let(:n) { -1.0001 }
    it { is_expected.to eq 0 }
  end

  context "when n = 0.5" do
    let(:n) { 0.5 }
    it { is_expected.to eq 0.5625 }
  end
end
