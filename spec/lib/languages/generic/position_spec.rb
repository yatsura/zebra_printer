require 'spec_helper'

describe Languages::Generic::Position do
  let(:test_class) { Class.new { include Languages::Generic::Position }}

  it "can add positions" do
    a = test_class[1,2]
    b = test_class[2,3]
    expect(a+b).to eq(test_class[3,5])
  end

  it "can compare positions" do
    a = test_class[1,2]
    b = test_class[1,2]
    expect(a).to eq(b)
  end

  it "can take elements from array" do
    a = [1,2]
    b = test_class[1,2]
    c = test_class.from_array a
    expect(c).to eq(b)
  end
end
