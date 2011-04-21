require 'spec_helper'

module Dozuki
  describe HTML do
    describe '.parse' do

      let(:args){["xml", :other, :args]}
      let(:nokogiri_node) {mock "nokogiri node"}
      let(:dozuki_html_node)  {mock "dozuki html node"}

      before(:each) do
        Nokogiri::HTML.stub(:parse).and_return(nokogiri_node)
        Node.stub(:new).and_return(dozuki_html_node)
      end

      subject{HTML.parse(*args)}

      it "should parse the HTML using nokogiri" do
        Nokogiri::HTML.should_receive(:parse).with(*args).and_return(nokogiri_node)
        subject
      end

      it "should create a new Node with the nokogiri doc" do
        Node.should_receive(:new).with(nokogiri_node).and_return(dozuki_html_node)
        subject
      end

      it {should == dozuki_html_node}

    end
  end
end
