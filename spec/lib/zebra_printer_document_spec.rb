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

  context "with data" do
    before :each do
      data = { :data_item_1 => 'data_item_1_value' }
      subject = ZebraPrinterDocument.new data
    end

    it "allows the data access as data" do
      expect(subject).to respond_to :data
    end
  end

  context "string coercion" do
    before :each do
      subject.language :zpl2
      subject.text 'hello world'
    end

    it "can be a string" do
      expect(subject.to_str).to include("^FDhello world^FS")
    end
  end
end
