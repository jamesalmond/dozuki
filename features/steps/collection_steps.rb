Then /^the results should contain "([^"]*)"$/ do |string|
  @results.should include(string)
end

Then /^the results should contain (\d+)$/ do |int|
  @results.should include(int.to_i)
end

Then /^the results should contain (\d+\.\d+)$/ do |float|
  @results.should include(float.to_f)
end
