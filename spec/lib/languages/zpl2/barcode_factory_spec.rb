require 'spec_helper'

describe Languages::Zpl2::BarcodeFactory do
  context ".create_barcode" do
    it "code_type = code_128" do
      expect(Languages::Zpl2::BarcodeFactory.create_barcode(:code_128)).to be_an_instance_of Languages::Zpl2::Barcode1D
    end

    it "code_type = ean13" do
      expect(Languages::Zpl2::BarcodeFactory.create_barcode(:ean13)).to be_an_instance_of Languages::Zpl2::Barcode1D
    end

    it "code_type = data_matrix" do
      expect(Languages::Zpl2::BarcodeFactory.create_barcode(:data_matrix)).to be_an_instance_of Languages::Zpl2::Barcode2D
    end
  end
end
