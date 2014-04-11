require 'spec_helper'

describe Languages::Zpl2::Position do
  subject {Languages::Zpl2::Position[1,2]}

  it "#render" do
    expect(subject.render).to eq("^FO1,2")
  end

  it "can add positions" do
    a = Languages::Zpl2::Position[1,2]
    b = Languages::Zpl2::Position[2,3]
    expect(a+b).to eq(Languages::Zpl2::Position[3,5])
  end

  it "can compare positions" do
    a = Languages::Zpl2::Position[1,2]
    b = Languages::Zpl2::Position[1,2]
    expect(a).to eq(b)
  end

  it "can take elements from array" do
    a = [1,2]
    b = Languages::Zpl2::Position[1,2]
    c = Languages::Zpl2::Position.from_array a
    expect(c).to eq(b)
  end
  
end
