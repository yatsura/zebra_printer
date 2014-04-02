require 'ostruct'

Given(/^some array data$/) do
  @data = [OpenStruct.new(:text => 'First Data', :barcode => '111111'),OpenStruct.new(:text => 'Last Data', :barcode => '999999')]
end

Given(/^a DSL with:$/) do |string|
  @dsl = string
end

Given(/^code:$/) do |string|
  @code = string
end
When(/^I execute the DSL$/) do
  @dsl_document = eval @dsl
end

When(/^I execute the code$/) do
  @document = eval @code
end


