When /^I parse the XML:$/ do |string|
  @doc = Dozuki::XML.parse(string)
end

Then /^the float result should be (\d+\.\d+)$/ do |float|
  @result.should == float.to_f
end

When /^I each the xpath "([^"]*)"$/ do |xpath|
  @results = []
  @doc.each(xpath) do |node|
    @results << node
  end
end

Then /^the results should contain a node with the text "([^"]*)"$/ do |text|
  @results.any?{|n| n.text == text}.should be_true
end

When /^I each the xpath "([^"]*)" as a string$/ do |xpath|
  @results = []
  @doc.each(xpath).as_string do |node|
    @results << node
  end
end

Then /^the results should contain the string "([^"]*)"$/ do |string|
  @results.should include(string)
end

When /^I each the xpath "([^"]*)" as an int$/ do |xpath|
  @results = []
  @doc.each(xpath).as_int do |node|
    @results << node
  end
end

Then /^the results should contain the integer (\d+)$/ do |int|
  @results.should include(int.to_i)
end

When /^I each the xpath "([^"]*)" as a float$/ do |xpath|
  @results = []
  @doc.each(xpath).as_float do |node|
    @results << node
  end
end

Then /^the results should contain the float (\d+\.\d+)$/ do |float|
  @results.should include(float.to_f)
end

Then /^the error should have the xpath "([^"]*)"$/ do |xpath|
  @error.xpath.should == xpath
end

Then /^the error should have a stored node$/ do
  @error.node.should_not be_nil
end

## new style

Then /^calling "([^"]*)" on the document should raise a "([^"]*)" error$/ do |code, error|
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
