require 'spec_helper'

describe ZebraPrinterDocument do
  context "language :epl2" do
    before :each do
      subject.language :epl2
    end
    
    it "language_processor is correct" do
      expect(subject.language_processor).to be_a Languages::Epl2
    end

    context "DSL" do
      [:text, :barcode, :position, :font, :rotate].each do |method|
        it "#{method.to_s}" do
          expect(subject).to respond_to method
        end
      end
    end

  end

  context "language :zpl2" do
    before :each do
      subject.language :zpl2
    end
    
    it "language_processor is correct" do
      expect(subject.language_processor).to be_a Languages::Zpl2
    end

    context "DSL" do
      [:text, :barcode, :position, :font, :rotate].each do |method|
        it "#{method.to_s}" do
          expect(subject).to respond_to method
        end
      end
    end
  end
end
