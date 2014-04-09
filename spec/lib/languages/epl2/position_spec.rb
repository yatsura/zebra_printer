require 'spec_helper'

describe Languages::Epl2::Position do
  subject { Languages::Epl2::Position.new 1,2 }

  its (:x) { should eq 1}
  its (:y) { should eq 2}
end
