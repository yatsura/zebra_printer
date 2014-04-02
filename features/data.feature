Feature: Data

  The DSL needs away of allowing data to be
  referenced


  Scenario: Data given in constructor
    Given some array data
    And a DSL with:
    """ruby
    ZebraPrinterDocument.new(@data) do
      language :zpl2
      text data.first.text
    end
    """
    When I execute the DSL
    Then the output should include "^FDFirst Data^FS"
