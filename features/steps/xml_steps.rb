When /^I (?:have )?parsed? the XML:$/ do |string|
  @doc = Dozuki::XML.parse(string)
end

When /^I call "([^"]*)" on the document$/ do |code|
  begin
    @result = @doc.instance_eval(code)
  rescue StandardError => e
    @error = e
  end
end

When /^I call "([^"]*)" on the document with a block$/ do |code|
  @result = @doc.instance_eval(code + "{|res| res}") # returns the variable passed to the block
end

When /^I call "([^"]*)" on the document and collect the results$/ do |code|
  @results = @doc.instance_eval("results = [];" + code + "{|res| results << res}; results;")
end

Then /^the (?:result|block parameter) should be a "([^"]*)"$/ do |type|
  @result.class.to_s.should == type
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
