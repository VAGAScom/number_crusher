$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "number_crusher"

include NumberCrusher

RSpec::Matchers.define_negated_matcher :an_array_excluding, :include

RSpec::Matchers.matcher :have_size do |expect_size|
  match do |actual|
    actual.size == expect_size
  end
end
