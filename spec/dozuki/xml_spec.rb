require 'spec_helper'

module Dozuki
  describe XML do
    
    describe "parse" do
      let(:string)        {"<lall><some xml='true' /></lall>"}
      let(:nokogiri_node) {mock "nokogiri node"}
      let(:dozuki_xml_node)  {mock "dozuki xml node"}
      before(:each) do
        Nokogiri::XML.stub(:parse).and_return(nokogiri_node)
        XML::Node.stub(:new).and_return(dozuki_xml_node)
      end
      subject{XML.parse(string)}
      it "should parse the xml using nokogiri" do
        Nokogiri::XML.should_receive(:parse).with(string)
        subject
      end
      it "should create a new Node with the nokogiri doc" do
        XML::Node.should_receive(:new).with(nokogiri_node)
        subject
      end
      it "should return the new node" do
        subject.should == dozuki_xml_node
      end
    end
    
  end
end