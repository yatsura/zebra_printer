Feature: Simple ASCII text

  The text option accepts a number of different arguments.
  The minimum number of arguments is x,y & the text.  This
  will generate a label that has the default rotation, scaling,
  font, horizntal and vertical multiliers and the image will be
  number (not reversed)

  Scenario: Basic text only DSL for EPL2
    Given I have a printer than understands "EPL2"
    And a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      text 1,0,''
    end
    """
    When I execute the DSL
    Then the output should include "A1,0,0,2,1,1,N,"""
    
  Scenario: Basic text only DSL for ZPL2
    Given I have a printer than understands "ZPL2"
    And a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      text 1,0,''
    end
    """
    When I execute the DSL
    Then the output should include "^FO1,0"
    And the output should include "^FD^FS"
    
