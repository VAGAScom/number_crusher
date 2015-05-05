require "spec_helper"

describe KdeBandwidthFinder do
  it_behaves_like "a Functor"

  let(:sample) { [1, 2, 2, 3, 4, 4, 5] }
  let(:function) { Epanechnikov() }
  let(:xs) { 0..6 }
  let(:bands) { 1..5 }

  let(:just_one_peak) do
    lambda do |xys|
      xys.each_cons(3).none? do |(a, b, c)|
        a[1] > b[1] && b[1] < c[1]
      end
    end
  end

  it "does stuff" do
    bandwidth = KdeBandwidthFinder(sample,
                                   function: function,
                                   xs: xs,
                                   bandwidths: bands,
                                   finder: just_one_peak)

    expect(bandwidth).to eq 2
  end
end
