require 'spec_helper'

describe "Languages support DSL" do
  context "EPL2" do
    [:text, :barcode, :position, :font, :rotate].each do |method|
      it "##{method.to_s}" do
        expect(Languages::Epl2.instance_methods).to include(method)
      end
    end
  end
  context "ZPL2" do
    [:text, :barcode, :position, :font, :rotate].each do |method|
      it "##{method.to_s}" do
        expect(Languages::Zpl2.instance_methods).to include(method)
      end
    end
  end
end
