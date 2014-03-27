require 'spec_helper'

describe Languages::Epl2 do
  context "A" do
    context "x,y and text" do
      it "x==1" do
        expect(subject.text(1,0,"")).to eq('A1,0,0,1,1,1,N,""')
      end

      it "y=1" do
        expect(subject.text(0,1,"")).to eq('A0,1,0,1,1,1,N,""')
      end

      it "text=\"hello world\"" do
        expect(subject.text(0,0,"hello world")).to eq('A0,0,0,1,1,1,N,"hello world"')
      end
    end
  end
end
