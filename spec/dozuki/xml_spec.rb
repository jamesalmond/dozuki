require 'spec_helper'

module Dozuki
  describe XML do
    describe "parse" do

      let(:args){["xml", :other, :args]}
      let(:nokogiri_node) {mock "nokogiri node"}
      let(:dozuki_xml_node)  {mock "dozuki xml node"}

      before(:each) do
        Nokogiri::XML.stub(:parse).and_return(nokogiri_node)
        Node.stub(:new).and_return(dozuki_xml_node)
      end

      subject{XML.parse(*args)}

      it "should parse the xml using nokogiri" do
        Nokogiri::XML.should_receive(:parse).with(*args).and_return(nokogiri_node)
        subject
      end

      it "should create a new Node with the nokogiri doc" do
        Node.should_receive(:new).with(nokogiri_node).and_return(dozuki_xml_node)
        subject
      end

      it {should == dozuki_xml_node}

    end
  end
end
