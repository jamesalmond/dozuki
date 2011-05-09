Feature: Iterating through nodes
  In order to provide simpler way of accessing groups of nods
  As a traverser
  I want to access nodes using the each method and an xpath

  Background:
    Given I have parsed the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
          <room_numbers>
            <number>5</number>
            <number>7</number>
          </room_numbers>
          <prices>
            <price>53.50</price>
            <price>799.78</price>
          </prices>
          <available>
            <day>2011-05-03</day>
            <day>2013-07-09</day>
          </available>
        </root>
      """

  Scenario: using each to traverse a document
    When I call "each('/root/rooms/room')" on the document and collect the results
    Then the results should contain a node with the text "SINGLE"
    And the results should contain a node with the text "Double"

  Scenario: using each to traverse a document and getting the string elements
    When I call "each('/root/rooms/room').as_string" on the document and collect the results
    Then the results should contain "SINGLE"
    And the results should contain "Double"

  Scenario: using each to traverse a document and getting the integer elements
    When I call "each('/root/room_numbers/number').as_int" on the document and collect the results
    Then the results should contain 5
    And the results should contain 7

  Scenario: using each to traverse a document and getting the float elements
    When I call "each('/root/prices/price').as_float" on the document and collect the results
    Then the results should contain 53.50
    And the results should contain 799.78

  Scenario: using each to traverse a document and getting the date elements
    When I call "each('/root/available/day').as_date" on the document and collect the results
    Then the results should contain 03/05/2011
    And the results should contain 09/07/2013
