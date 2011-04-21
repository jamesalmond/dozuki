require 'spec_helper'

describe Dozuki do
  describe "HTML()" do
    let(:args){[1,2,3]}
    subject{ Dozuki::HTML(*args)}
    it "should proxy to the parse method" do
      node = mock(:node)
      Dozuki::HTML.should_receive(:parse).with(*args).and_return(node)
      subject.should == node
    end
  end
end
