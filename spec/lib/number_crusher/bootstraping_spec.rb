require "spec_helper"

describe Bootstraping do
  shared_examples "bootstraping" do
    it "bootstraps an estimator" do
      ones = subject.count(1)
      twos = subject.count(2)
      threes = subject.count(3)
      expect(subject).to have_size(100)
      expect(twos).to be > ones && be > threes
    end
  end

  matcher :bootstraps do |expected|
    match do |actual|
      expect(actual).to \
        have_size(100) &&
        satisfy { |a| a.count(2) > a.count(3) }
    end
  end

  subject { Bootstraping([1, 2, 3], function: Quantile(quant: 0.5), samples: 100) }

  it "bootstraps an estimator" do
    expect(subject).to bootstraps
  end

  context 'called by "call"' do
    subject { Bootstraping.new(function: Quantile(quant: 0.5), samples: 100).call([1, 2, 3]) }
    it_behaves_like "bootstraping"
  end
end
