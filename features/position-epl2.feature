Feature: Position in EPL2

  position set the origin for anything with the
  block or from last call.  Any use of the :at
  option move the location relative to the set
  position
  
  Scenario: Position block
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      position(12,34) do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should include "A12,34,0,2,1,1,N,"""
        
  Scenario: Move text relative to position
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      position(12,34) do
        text '', :at => [10,10]
      end
    end
    """
    When I execute the DSL
    Then the output should include "A22,44,0,2,1,1,N,"""
      
    Scenario: Position block in mm
      Given a DSL with:
      """ruby
      ZebraPrinterDocument.new do
        language :epl2
        position(12.mm,34.mm) do
          text ''
        end
      end
      """
    When I execute the DSL
    Then the output should include "A96,272,0,2,1,1,N,"""

    Scenario: Move text relative to position in mm
      Given a DSL with:
      """ruby
      ZebraPrinterDocument.new do
        language :epl2
        position(6.mm,17.mm) do
          text '', :at => [6.mm,17.mm]
        end
      end
      """
    When I execute the DSL
    Then the output should include "A96,272,0,2,1,1,N,"""

