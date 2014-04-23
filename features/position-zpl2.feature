Feature: Position

  position set the origin for anything with the
  block or from last call.  Any use of the :at
  option move the location relative to the set
  position

  Scenario: Position block ZPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      position(12,34) do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should include "^FO12,34"
    And the output should include "^FD^FS"

  Scenario: Position block ZPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      position(12,34) do
        text '', :at => [10,10]
      end
    end
    """
    When I execute the DSL
    Then the output should include "^FO22,44"
    And the output should include "^FD^FS"

    Scenario: Position block in mm
      Given a DSL with:
      """ruby
      ZebraPrinterDocument.new do
        language :zpl2
        position(12.mm,34.mm) do
          text ''
        end
      end
      """
    When I execute the DSL
    Then the output should include "^FO96,272"  
    And the output should include "^FD^FS"

    Scenario: Move text relative to position in mm
      Given a DSL with:
      """ruby
      ZebraPrinterDocument.new do
        language :zpl2
        position(6.mm,17.mm) do
          text '', :at => [6.mm,17.mm]
        end
      end
      """
    When I execute the DSL
    Then the output should include "^FO96,272"        
    And the output should include "^FD^FS"

    
