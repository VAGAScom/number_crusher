$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "number_crusher"

include NumberCrusher

RSpec::Matchers.define_negated_matcher :an_array_excluding, :include

RSpec::Matchers.matcher :have_size do |expect_size|
  match do |actual|
    actual.size == expect_size
  end
end
RSpec::Matchers.matcher :have do |expected|
  match do |actual|
    actual.count == expected
  end
  chain :items do
  end
  chain :item do
  end
  description do
    "have #{expected} #{expected == 1 ? "item" : "items" }"
  end
end

RSpec::Matchers.matcher :have_more do |expected|
  match do |actual|
    actual.count(expected) > actual.count(lesser)
  end
  chain :than, :lesser
  description do
    "have more #{expected}'s than #{lesser}'s"
  end
end

RSpec.shared_examples "a Functor" do
  it 'has a "call" method' do
    expect(described_class.instance_methods(false)).to include(:call)
  end

  it "can be called as a function" do
    function_name = described_class.to_s.sub("NumberCrusher::", "").to_sym
    expect(NumberCrusher).to respond_to(function_name)
  end
end
