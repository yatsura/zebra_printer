require 'spec_helper'

describe Languages::Zpl2::Barcode1D do
  context "code 128" do
    it "#render" do
      font = Languages::Zpl2::Font.new 
      barcode = Languages::Zpl2::Barcode1D.new font, :code_128
      expect(barcode.render('hello_world')).to eq("^BCN,#{font.height*2},Y,N,N^FDhello_world^FS")
    end
  end
  context "ean13" do
    it "#render" do
      font = Languages::Zpl2::Font.new 
      barcode = Languages::Zpl2::Barcode1D.new font, :ean13
      expect(barcode.render('hello_world')).to eq("^BEN,#{font.height*2},Y,N,N^FDhello_world^FS")      
    end
  end
end
