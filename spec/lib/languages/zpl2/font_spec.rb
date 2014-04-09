require 'spec_helper'

describe Languages::Zpl2::Font do
  context "#font_size :normal" do
    subject { Languages::Zpl2::Font.new :size => :normal}
    its(:name) { should eq "0" }
    its(:rotation) { should eq "N" }
    its(:height) { should eq 25 }
    its(:width) { should eq 25 }    
  end
  context "#font_size :small" do
    subject { Languages::Zpl2::Font.new :size => :small}
    its(:name) { should eq "0" }
    its(:rotation) { should eq "N" }
    its(:height) { should eq 20 }
    its(:width) { should eq 20 }    
  end
  context "#font_size :large" do
    subject { Languages::Zpl2::Font.new :size => :large}
    its(:name) { should eq "0" }
    its(:rotation) { should eq "N" }
    its(:height) { should eq 40 }
    its(:width) { should eq 40 }    
  end
  context "#font_size :x_large" do
    subject { Languages::Zpl2::Font.new :size => :x_large}
    its(:name) { should eq "0" }
    its(:rotation) { should eq "N" }
    its(:height) { should eq 60 }
    its(:width) { should eq 60 }    
  end

  context "#font_rotation" do
    let(:font) { Languages::Zpl2::Font.new }
    it ":by_90" do
      expect(font.font_rotation(:by_90)).to eq "R"
    end
    it ":by_180" do
      expect(font.font_rotation(:by_180)).to eq "I"
    end
    it ":by_270" do
      expect(font.font_rotation(:by_270)).to eq "B"
    end
    it ":by_0" do
      expect(font.font_rotation(:by_0)).to eq "N"
    end

  end
end
