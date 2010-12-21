Feature: Exists accessor
  In order to easily determine whether a node exists in a document
  As a traverser
  I want to check whether a node exists
  
  
  Scenario: the node exists
   When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    Then the xpath "/root/number_of_rooms" should exist
    
  Scenario: the node doesn't exist
    When I parse the XML:
        """
          <root>
            <hotel>lame</hotel>
            <cost>20.00</cost>
            <number_of_rooms>2</number_of_rooms>
          </root>
        """
      Then the xpath "/root/number_of_drug_barons" should not exist