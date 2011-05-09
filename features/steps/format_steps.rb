Then /^the result should be "([^"]*)"$/ do |string|
  @result.should == string
end

Then /^the result should be (\d+)$/ do |int|
  @result.should == int.to_i
end

Then /^the result should be (\d+\.\d+)$/ do |float|
  @result.should == float.to_f
end

Then /^the result should be true$/ do
  @result.should == true
end

Then /^the result should be false$/ do
  @result.should == false
end

Then /^the result should be (\d+)\/(\d+)\/(\d+)$/ do |day, month, year|
  @result.should == Date.civil(year.to_i, month.to_i, day.to_i)
end

