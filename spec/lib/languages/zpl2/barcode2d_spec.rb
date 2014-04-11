require 'spec_helper'

describe Languages::Zpl2::Barcode2D do
  context "data_matrix" do
    it "#render" do
      font = Languages::Zpl2::Font.new 
      barcode = Languages::Zpl2::Barcode2D.new :data_matrix, :font => font, :text => 'hello_world'
      expect(barcode.render).to eq("^BXN,4,200,16,16^FDhello_world^FS")
    end
  end
end
