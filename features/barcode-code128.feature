Feature: CODE 128 barcode
            
  Code 128 is a very high-density barcode symbology.
  It is used for alphanumeric or numeric-only barcodes.
  It can encode all 128 characters of ASCII and, by
  use of an extension character (FNC4), the Latin-1
  characters defined in ISO/IEC 8859-1

  Code 128 is used on patient labels and tube labels
  within ECMC

  Scenario: Code 128 on EPL
    Given I have a printer than understands "EPL2"
    And a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      barcode :code_128, 'hello', :at => [1,2]
    end
    """
    When I execute the DSL
    Then the output should include "B1,2,0,1,2,2,50,B,"hello""
    
  Scenario: Code 128 on ZPL
    Given I have a printer than understands "ZPL2"
    And a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      barcode :code_128, 'hello', :at => [1,2]
    end
    """
    When I execute the DSL
    Then the output should include "^BCN,30,Y,N,N"
    And the output should include "^FDhello^FS"
    
    
