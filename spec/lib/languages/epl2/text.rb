require 'spec_helper' 

describe Languages::Epl2::Text do
  it "#render" do
    expect(subject.render).to be_a(String)
  end

  it "#x" do
    subject.x = 10
    expect(subject.render.split(',')[0]).to eq("A10")
  end

  it "#y" do
    subject.y = 10
    expect(subject.render.split(',')[1]).to eq("10")
  end
end
