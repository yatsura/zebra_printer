require 'spec_helper'

describe Languages::Epl2::Font do
  context "#font_size :normal" do
    subject { Languages::Epl2::Font.new :size => :normal}
    its(:name) { should eq 2 }
    its(:rotation) { should eq 0 }
    its(:height) { should eq 1 }
    its(:width) { should eq 1 }    
  end
  context "#font_size :small" do
    subject { Languages::Epl2::Font.new :size => :small}
    its(:name) { should eq 1 }
    its(:rotation) { should eq 0 }
    its(:height) { should eq 1 }
    its(:width) { should eq 1 }    
  end
  context "#font_size :large" do
    subject { Languages::Epl2::Font.new :size => :large}
    its(:name) { should eq 3 }
    its(:rotation) { should eq 0 }
    its(:height) { should eq 1 }
    its(:width) { should eq 1 }    
  end
  context "#font_size :x_large" do
    subject { Languages::Epl2::Font.new :size => :x_large}
    its(:name) { should eq 4 }
    its(:rotation) { should eq 0 }
    its(:height) { should eq 1 }
    its(:width) { should eq 1 }    
  end

  context "#font_rotation" do
    let(:font) { Languages::Epl2::Font.new }
    it ":by_90" do
      expect(font.font_rotation(:by_90)).to eq 1
    end
    it ":by_180" do
      expect(font.font_rotation(:by_180)).to eq 2
    end
    it ":by_270" do
      expect(font.font_rotation(:by_270)).to eq 3
    end
    it ":by_0" do
      expect(font.font_rotation(:by_0)).to eq 0
    end

  end
end
