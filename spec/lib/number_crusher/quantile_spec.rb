require "spec_helper"

describe Quantile do
  it "returns empty if empty data" do
    expect(Quantile([], quant: 0.0)).to eq nil
  end

  it "returns average of quantile elements" do
    expect(Quantile([2, 1], quant: 0.5)).to eq 1.5
    expect(Quantile([2, 1, 4, 3], quant: 0.5)).to eq 2.5
    expect(Quantile([2, 2, 1, 10], quant: 0.5)).to eq 2
    expect(Quantile([1, 3, 2], quant: Rational(1, 3))).to eq 1.5
  end

  it "returns quantile" do
    expect(Quantile([1], quant: 0.5)).to eq 1
    expect(Quantile([1], quant: 0.9)).to eq 1
    expect(Quantile([1, 3, 2], quant: 0.5)).to eq 2
    expect(Quantile([2, 2, 1, 10, 9], quant: 0.25)).to eq 2
    expect(Quantile([2, 2, 1, 10, 9], quant: 0.75)).to eq 9
    expect(Quantile([2, 2, 1, 10, 9], quant: 0.99)).to eq 10
    expect(Quantile([2, 2, 1, 10, 9], quant: 0.001)).to eq 1
    expect(Quantile([2, 2, 1, 10], quant: 0.4)).to eq 2
    expect(Quantile([2, 2, 1, 10], quant: 0.2)).to eq 1
  end

  it "returns first element if quantile == 0.0" do
    expect(Quantile([1], quant: 0.0)).to eq 1
    expect(Quantile([3, 2, 4], quant: 0.0)).to eq 2
  end

  it "returns last element if quantile == 1.0" do
    expect(Quantile([1], quant: 1.0)).to eq 1
    expect(Quantile([3, 2, 4], quant: 1.0)).to eq 4
  end
end
