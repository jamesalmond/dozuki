Feature: Iterating through nodes
  In order to provide simpler way of accessing groups of nods
  As a traverser
  I want to access nodes using the each method and an xpath
  
  Scenario: using each to traverse a document
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
        </root>
      """
    And I call "each('/root/rooms/room')" on the document and collect the results
    Then the results should contain a node with the text "SINGLE"
    And the results should contain a node with the text "Double"
  
  Scenario: using each to traverse a document and getting the string elements
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
        </root>
      """
    And I call "each('/root/rooms/room').as_string" on the document and collect the results
    Then the results should contain "SINGLE"
    And the results should contain "Double"
  
  Scenario: using each to traverse a document and getting the integer elements
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
          <rooms>
            <room>5</room>
            <room>7</room>
          </rooms>
        </root>
      """
    And I call "each('/root/rooms/room').as_int" on the document and collect the results
    Then the results should contain 5
    And the results should contain 5
  
  Scenario: using each to traverse a document and getting the float elements
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
          <rooms>
            <room>53.50</room>
            <room>799.78</room>
          </rooms>
        </root>
      """
    And I call "each('/root/rooms/room').as_float" on the document and collect the results
    Then the results should contain 53.50
    And the results should contain 799.78