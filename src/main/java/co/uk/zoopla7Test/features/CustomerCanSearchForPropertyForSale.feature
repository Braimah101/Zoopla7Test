Feature: Search Properties For Sale
  As a customer
  I want the ability to search for sale
  So that I can purchase the property


  Scenario Outline: Customer can search for any property
    Given I navigate to zoopla homepage
    When  I enter a "<Location>" in the search text box
    And I select "<MInPrice>" from Min price dropdown
    And I select "<MaxPrice>" from Max price dropdown
    And I select "<property>" from the property type dropdown
    And I select "<Bed>" from the Bedroom dropdown
    And I click on search button
    Then a list of "PropertyType>" are displayed

    Examples:
      |Location  |MInPrice | MaxPrice | Property|Bed |PropertyType|
      |Manchester |£120,000|£230,000  |Houses   | 3+ |Houses      |
      |London     |£300,000|£450,000  |Farms/land|No Min | property|
      | Coventry  | £120,000 |£150,000 |flats     |3+ |    |


    Scenario Outline: Customer cannot search for property with missing values
      Given I navigate to zoopla homepage
      When  I enter a "<Location>" in the search text box
      And I select "<MInPrice>" from Min price dropdown
      And I select "<MaxPrice>" from Max price dropdown
      And I select "<property>" from the property type dropdown
      And I select "<Bed>" from the Bedroom dropdown
      And I click on search button
      Then an error message is displayed

      Examples:
        |Location  | |  | | ||
        | ||  |  |  |    |
        |    || || | |
        |   |  | |     ||    |

      Scenario Outline: Error page is displayed for invalid search
        Given I navigate to zoopla homepage
        When  I enter a "<Location>" in the search text box
        And I select "<MInPrice>" from Min price dropdown
        And I select "<MaxPrice>" from Max price dropdown
        And I select "<property>" from the property type dropdown
        And I select "<Bed>" from the Bedroom dropdown
        And I click on search button
        Then an error result page is displayed

        Examples:
          |Location | |  | | ||
          |£££££ |£|£  |  |  |     |
          |     ||  ||| |
          |   |  ||     | |    |


