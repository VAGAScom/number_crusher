require "spec_helper"

describe NumberCrusher do
  include NumberCrusher

  it "has a version number" do
    expect(NumberCrusher::VERSION).not_to be nil
  end
end
