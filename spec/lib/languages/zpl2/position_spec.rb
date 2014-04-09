require 'spec_helper'

describe Languages::Zpl2::Position do
  subject {Languages::Zpl2::Position.new 1,2}

  its(:x) { should eq 1}
  its(:y) { should eq 2}
end
