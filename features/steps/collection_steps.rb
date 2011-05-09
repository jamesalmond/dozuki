Then /^the results should contain "([^"]*)"$/ do |string|
  @results.should include(string)
end

Then /^the results should contain (\d+)$/ do |int|
  @results.should include(int.to_i)
end

Then /^the results should contain (\d+\.\d+)$/ do |float|
  @results.should include(float.to_f)
end

Then /^the results should contain (\d+)\/(\d+)\/(\d+)$/ do |day, month, year|
  @results.should include(Date.civil(year.to_i, month.to_i, day.to_i))
end

