require "spec_helper"

describe Quantile do
  it_behaves_like "a Functor"

  it "returns empty if empty data" do
    expect(Quantile([], quant: 0.0)).to eq nil
  end

  let(:median) { Quantile(sample, quant: 0.5) }
  let(:median_sorted) { Quantile(sample, quant: 0.5, sorted: true) }
  let(:first_quartile) { Quantile(sample, quant: 0.25) }
  let(:third_quartile) { Quantile(sample, quant: 0.75) }
  let(:zeroeth_quantile) { Quantile(sample, quant: 0.0) }
  let(:hundredth_quantile) { Quantile(sample, quant: 1) }

  context "with 1, 2, 3 scrambled" do
    let(:sample) { [1, 3, 2] }
    it { expect(median).to eq 2 }
  end

  context "with 1, 2, 3 as lazy sequence" do
    let(:sample) { [1, 2, 3].each }
    it { expect { median }.not_to raise_exception }
  end

  context "over a 1 element sample" do
    let(:sample) { [1] }
    it { expect(median).to eq 1 }
    it { expect(first_quartile).to eq 1 }
    it { expect(third_quartile).to eq 1 }
    it { expect(zeroeth_quantile).to eq 1 }
    it { expect(hundredth_quantile).to eq 1 }
  end

  context "over a 100 ordered elements sample (1 to 100)" do
    let(:sample) { (1..100).to_a }
    it { expect(median).to eq 50.5 }
    it { expect(first_quartile).to eq 25.5 }
    it { expect(third_quartile).to eq 75.5 }
    it { expect(zeroeth_quantile).to eq 1 }
    it { expect(hundredth_quantile).to eq 100 }
  end

  context "over a 1000 ordered elements sample (1 to 1000)" do
    let(:sample) { (1..1000).to_a }
    it { expect(median).to eq 500.5 }
    it { expect(first_quartile).to eq 250.5 }
    it { expect(third_quartile).to eq 750.5 }
    it { expect(zeroeth_quantile).to eq 1 }
    it { expect(hundredth_quantile).to eq 1000 }
  end

  context "over a 99 ordered elements sample (1 to 99)" do
    let(:sample) { (1..99).to_a }
    it { expect(median).to eq 50 }
    it { expect(median_sorted).to eq 50 }
    it { expect(first_quartile).to eq 25 }
    it { expect(third_quartile).to eq 75 }
    it { expect(zeroeth_quantile).to eq 1 }
    it { expect(hundredth_quantile).to eq 99 }
  end

  context "over a 99 randomized elements sample (1 to 99), sorted" do
    let(:sample) { (1..30).to_a + (31..60).to_a.reverse + (61..99).to_a }
    it { expect(median_sorted).to eq 41 }
  end
end
