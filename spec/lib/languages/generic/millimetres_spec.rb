require 'spec_helper'

describe Languages::Generic::Millimetres do
  let(:mm_a) { Languages::Generic::Millimetres.new 25 }
  let(:mm_b) { Languages::Generic::Millimetres.new 20 }
  
  it "can add mm" do
    expect(mm_a + mm_b).to eq(Languages::Generic::Millimetres.new(45))
  end

  it "can subtract mm" do
    expect(mm_a - mm_b).to eq(Languages::Generic::Millimetres.new(5))
  end

  it "can add int" do
    expect(5 + mm_b).to eq(mm_a)
    expect(mm_b + 5).to eq(mm_a)
  end

  it "can subtract mm" do
    expect(25 - mm_b).to eq(Languages::Generic::Millimetres.new(5))
    expect(mm_a - 20).to eq(Languages::Generic::Millimetres.new(5))
  end
  
  it "compare mm" do
    expect(mm_a).to eq(Languages::Generic::Millimetres.new(25))
  end

  it "25 mm at 203 DPI" do
    expect(mm_a.to_dots).to eq(Languages::Generic::Dots.new(200))
  end

  it "25 mm at 300 DPI" do
    expect(mm_a.to_dots(:dpi300)).to eq(Languages::Generic::Dots.new(295))
  end
end
