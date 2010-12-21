require 'rspec'
require File.join(File.dirname(__FILE__),'../lib/dozuki')
Dir[File.join(File.dirname(__FILE__),"support/**/*.rb")].each   {|f| require f}