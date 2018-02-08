Feature: CODE 128 barcode
            
  Code 128 is a very high-density barcode symbology.
  It is used for alphanumeric or numeric-only barcodes.
  It can encode all 128 characters of ASCII and, by
  use of an extension character (FNC4), the Latin-1
  characters defined in ISO/IEC 8859-1

  Code 128 is used on patient labels and tube labels
  within ECMC

  Scenario: Code 128 on EPL
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      barcode :code_128, 'hello', :at => [1,2]
    end
    """
    When I execute the DSL
    Then the output should include "B1,2,0,1,2,2,50,B,"hello""

  Scenario: Code 128 on EPL with millimetres
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      barcode :code_128, 'hello', :at => [1.mm,2.mm]
    end
    """
    When I execute the DSL
    Then the output should include "B8,16,0,1,2,2,50,B,"hello""

  Scenario: Code 128 on ZPL
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      barcode :code_128, 'hello', :at => [1,2]
    end
    """
    When I execute the DSL 
    Then the output should include "^BCN,30,Y,N,N"
    And the output should include "^FO1,2"
    And the output should include "^FDhello^FS"

  Scenario: Code 128 on ZPL
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      barcode :code_128, 'hello', :at => [1.mm,2.mm]
    end
    """
    When I execute the DSL
    Then the output should include "^BCN,30,Y,N,N"
    And the output should include "^FO8,16"
    And the output should include "^FDhello^FS"

  Scenario: Code 128 on ZPL
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      barcode :code_128, 'hello', :height => 100
    end
    """
    When I execute the DSL
    Then the output should include "^BCN,100,Y,N,N"
    And the output should include "^FDhello^FS"

