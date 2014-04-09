require 'spec_helper'
require 'ostruct'

describe Languages::Zpl2::Document do
  let(:document_output)  { subject.render.strip }
  it "starts with ^XA" do
    expect(document_output).to start_with("^XA")
  end

  it "concat strings" do
    subject << "hello_world"
    expect(document_output).to include("hello_world")
  end

  it "calls render on objects" do
    subject << OpenStruct.new(:render => 'hello_world')
    expect(document_output).to include("hello_world")
  end
  
  it "ends with ^XZ" do
    expect(document_output).to end_with("^XZ")
  end
end
