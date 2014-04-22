require 'spec_helper'

describe Languages::Generic::Dots do
  let(:dots_a) { Languages::Generic::Dots.new 25 }
  let(:dots_b) { Languages::Generic::Dots.new 25 }
  
  it "can add dots" do
    expect(dots_a + dots_b).to eq(Languages::Generic::Dots.new(50))
  end

  it "can subtract dots" do
    expect(dots_a - dots_b).to eq(Languages::Generic::Dots.new(0))
  end

  it "compare dots" do
    expect(dots_a).to eq(dots_b)
  end
end
