Feature: Rotation of ASCII text

  Text can be rotated by 0,90,180,270 degrees.
  This will affect all text that comes within the
  rotation section. The rotation happens clockwise

  Scenario: Rotate text 90 degrees for EPL2
    Given I have a printer than understands "EPL2"
    And a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      rotate :by_90 do
        text 1,0,''
      end
    end
    """
    When I execute the DSL
    Then the output should include "A1,0,1,2,1,1,N,"""

  Scenario: Rotate text 90 degrees for ZPL2
    Given I have a printer than understands "ZPL2"
    And a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      rotate :by_90 do
        text 1,0,''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "\^A[A-Z]R,\d+,\d+"

  Scenario: Late evaluation of rotated text
    Given I have a printer than understands "ZPL2"
    And code:
    """ruby
    a = ZebraPrinterDocument.new
    a.language :zpl2
    label = Proc.new do
      rotate :by_90 do
        text 1,0,''
      end
    end
    a.process(&label)
    a.document
    """
    When I execute the code
    Then the output should be like "\^A[A-Z]R,\d+,\d+"

