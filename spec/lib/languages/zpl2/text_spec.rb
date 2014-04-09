require 'spec_helper'

describe Languages::Zpl2::Text do
  subject { Languages::Zpl2::Text.new "hello_world"}
  its(:render) { should eq("^FDhello_world^FS")}
end
