When /^I parse the XML:$/ do |string|
  @doc = Dozuki::XML.parse(string)
end

When /^I get the xpath "([^"]*)"$/ do |xpath|
  @node = @doc.get(xpath)
end

When /^I get the xpath "([^"]*)" with a block$/ do |xpath|
  @doc.get(xpath) do |node|
    @node = node
  end
end

Then /^the node should be a "([^"]*)"$/ do |type|
  @node.class.to_s.should == type
end

Then /^the node should have (\d+) elements$/ do |count|
  @node.children.select{|e| e.is_a?(Nokogiri::XML::Element)}.count.should == count.to_i
end

Then /^the node should have the text "([^"]*)"$/ do |text|
  @node.text.should == text
end

Then /^the node should be empty$/ do
  @node.should be_nil
end

Then /^(get|string|int|float)t?ing the xpath "([^"]*)" should raise a "([^"]*)" error$/ do |method,xpath, error|
  begin
    @doc.send(method,xpath)
    fail
  rescue Dozuki::XML.const_get(error) => e
    @error = e
  end
end

When /^I string the xpath "([^"]*)"$/ do |xpath|
  @result = @doc.string(xpath)
end

Then /^the string result should be "([^"]*)"$/ do |string|
  @result.should == string
end

When /^I int the xpath "([^"]*)"$/ do |xpath|
  @result = @doc.int(xpath)
end

Then /^the int result should be (\d+)$/ do |int|
  @result.should == int.to_i
end

When /^I float the xpath "([^"]*)"$/ do |xpath|
  @result = @doc.float(xpath)
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

Then /^the xpath "([^"]*)" should exist$/ do |xpath|
  @doc.exists?(xpath).should be_true
end

Then /^the xpath "([^"]*)" should not exist$/ do |xpath|
  @doc.exists?(xpath).should be_false
end


