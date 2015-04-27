require "spec_helper"

describe Average do
  it "calculates the average" do
    expect(Average([1, 2, 3])).to eq 2.0
    expect(Average.call([1, 2, 3])).to eq Average([1, 2, 3])
  end
end
