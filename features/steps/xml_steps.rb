When /^I parse the XML:$/ do |string|
  @doc = Dozuki::XML.parse(string)
end

Then /^the float result should be (\d+\.\d+)$/ do |float|
  @result.should == float.to_f
end

Then /^the error should have the (\w+) "([^"]*)"$/ do |method, value|
  @error.send(method).should == value
end

Then /^the error should have a stored node$/ do
  @error.node.should_not be_nil
end

Then /^calling "([^"]*)" on the document should raise an? "([^"]*)" error$/ do |code, error|
  begin
    @doc.instance_eval(code)
    fail "Expected error #{error}, nothing raised"
  rescue Dozuki::XML.const_get(error) => e
    @error = e
  end
end

When /^I call "([^"]*)" on the document$/ do |code|
  @result = @doc.instance_eval(code)
end

When /^I call "([^"]*)" on the document with a block$/ do |code|
  @result = @doc.instance_eval(code + "{|res| res}") # returns the variable passed to the block
end

When /^I call "([^"]*)" on the document and collect the results$/ do |code|
  @results = @doc.instance_eval("results = [];" + code + "{|res| results << res}; results;")
end

Then /^the result should be (\d+)$/ do |int|
  @result.should == int.to_i
end

Then /^the result should be "([^"]*)"$/ do |string|
  @result.should == string
end

Then /^the result should be (\d+\.\d+)$/ do |float|
  @result.should == float.to_f
end

Then /^the (?:result|block parameter) should be a "([^"]*)"$/ do |type|
  @result.class.to_s.should == type
end

Then /^the result should be true$/ do
  @result.should be_true
end

Then /^the result should be false$/ do
  @result.should be_false
end

Then /^the (?:result|parameter) should have (\d+) elements$/ do |count|
  @result.children.select{|e| e.is_a?(Nokogiri::XML::Element)}.count.should == count.to_i
end

Then /^the result should have the (.*) "([^"]*)"$/ do |method, value|
  @result.send(method).should == value
end

Then /^the results should contain a node with the text "([^"]*)"$/ do |text|
  @results.any?{|n| n.text == text}.should be_true
end

Then /^the results should contain "([^"]*)"$/ do |string|
  @results.should include(string)
end

Then /^the results should contain (\d+)$/ do |int|
  @results.should include(int.to_i)
end

Then /^the results should contain (\d+\.\d+)$/ do |float|
  @results.should include(float.to_f)
end
