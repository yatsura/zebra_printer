require 'spec_helper'

describe Languages::Epl2::Barcode2D do
  context "data_matrix" do
    it "#render" do
      font = Languages::Epl2::Font.new 
      barcode = Languages::Epl2::Barcode2D.new :data_matrix, :font => font, :position => [1,2], :text => "3"
      expect(barcode.render).to eq("b1,2,D,c16,r16,\"3\"")
    end
  end
end
