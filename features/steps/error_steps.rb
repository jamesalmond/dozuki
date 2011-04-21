Then /^it should raise an? "([^"]*)" error$/ do |error|
  @error.should be_a Dozuki::XML.const_get(error)
end

Then /^the error should have the (\w+) "([^"]*)"$/ do |method, value|
  @error.send(method).should == value
end

Then /^the error should have a stored node$/ do
  @error.node.should_not be_nil
end
