Feature: Iterating through nodes
  In order to provide simpler way of accessing groups of nods
  As a traverser
  I want to access nodes using the each method and an xpath
  
  Scenario: using each to traverse a document
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
        </root>
      """
    And I each the xpath "/root/rooms/room"
    Then the results should contain a node with the text "SINGLE"
    And the results should contain a node with the text "Double"
  
  Scenario: using each to traverse a document and getting the string elements
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
        </root>
      """
    And I each the xpath "/root/rooms/room" as a string
    Then the results should contain the string "SINGLE"
    And the results should contain the string "Double"
  
  Scenario: using each to traverse a document and getting the integer elements
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
          <rooms>
            <room>5</room>
            <room>7</room>
          </rooms>
        </root>
      """
    And I each the xpath "/root/rooms/room" as an int
    Then the results should contain the integer 5
    And the results should contain the integer 5
  
  Scenario: using each to traverse a document and getting the float elements
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
          <rooms>
            <room>53.50</room>
            <room>799.78</room>
          </rooms>
        </root>
      """
    And I each the xpath "/root/rooms/room" as a float
    Then the results should contain the float 53.50
    And the results should contain the float 799.78