require 'spec_helper'

describe Languages::Zpl2::Speed do
  context "normal" do
    subject { Languages::Zpl2::Speed.new :normal}
    its(:render) { should start_with("^PRA")}
  end
  context "fast" do
    subject { Languages::Zpl2::Speed.new :fast}
    its(:render) { should start_with("^PRC")}
  end
  context "slow" do
    subject { Languages::Zpl2::Speed.new :slow}
    its(:render) { should start_with("^PR1")}
  end

end
