require 'spec_helper'

describe Languages::Epl2::Barcode1D do
  context "code 128" do
    it "#render" do
      font = Languages::Epl2::Font.new 
      barcode = Languages::Epl2::Barcode1D.new font, :code_128
      expect(barcode.render(1,2,3)).to eq("B1,2,0,1,2,2,50,B,\"3\"")
    end
  end
  context "ean13" do
    it "#render" do
      font = Languages::Epl2::Font.new 
      barcode = Languages::Epl2::Barcode1D.new font, :ean13
      expect(barcode.render(1,2,3)).to eq("B1,2,0,E30,2,2,50,B,\"3\"")
    end
  end

end
