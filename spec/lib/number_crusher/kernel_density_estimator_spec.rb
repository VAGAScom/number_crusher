require "spec_helper"

describe KernelDensityEstimator do
  it_behaves_like "a Functor"

  subject do
    KernelDensityEstimator(sample,
                           function: Epanechnikov(),
                           bandwidth: 1, xs: xs)
  end

  context "no sample" do
    let(:sample) { [] }
    let(:xs) { [1] }
    it { is_expected.to eq [] }
  end

  context "no x's" do
    let(:sample) { [1] }
    let(:xs) { [] }
    it { is_expected.to eq [] }
  end

  context "with sample [1]" do
    let(:sample) { [1] }

    context "and x's as [1] (single point)" do
      let(:xs) { [1] }
      it { is_expected.to eq [[1, 0.75]] }
    end

    context "and x's as [0.5, 1.5]" do
      let(:xs) { [0.5, 1.5] }
      it { is_expected.to eq [[0.5, 0.5625], [1.5, 0.5625]] }
    end
  end

  context "with sample [1, 2]" do
    let(:sample) { [1, 2] }

    context "and x's as [1] (single point)" do
      let(:xs) { [1] }
      it { is_expected.to eq [[1, 0.75 / 2]] }
    end

    context "and x's as [0.5, 1.5]" do
      let(:xs) { [0.5, 1.5] }
      it { is_expected.to eq [[0.5, 0.5625 / 2], [1.5, 0.5625]] }
    end
  end

  context "with sample as enumerator" do
    let(:sample) { [1].each }
    let(:xs) { [1] }
    it { is_expected.to eq [[1, 0.75]] }
  end
end
