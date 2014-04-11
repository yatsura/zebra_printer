require 'spec_helper'

describe Languages::Epl2::Position do
  subject { Languages::Epl2::Position[1,2] }

  it "render should be empty" do
    expect(subject.render).to eq("")
  end
end
