require 'spec_helper'

describe Languages::Epl2::Barcode2D do
  context "data_matrix" do
    it "#render" do
      font = Languages::Epl2::Font.new 
      barcode = Languages::Epl2::Barcode2D.new font, :data_matrix
      expect(barcode.render(1,2,3)).to eq("b1,2,D,c16,r16,\"3\"")
    end
  end
end
