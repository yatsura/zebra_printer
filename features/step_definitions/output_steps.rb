Then(/^the output should include "(.*)"$/) do |arg1|
  @document = @dsl_document unless  @document
  @document.to_s.should include(arg1)
end

Then(/^the output should be like "(.*?)"$/) do |arg1|
  @document = @dsl_document unless  @document
  @document.should match(Regexp.new(arg1))
end
