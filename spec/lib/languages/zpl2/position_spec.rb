require 'spec_helper'

describe Languages::Zpl2::Position do
  subject {Languages::Zpl2::Position[1,2]}

  it "#render" do
    expect(subject.render).to eq("^FO1,2")
  end
end
