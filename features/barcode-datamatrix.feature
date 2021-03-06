Feature: Data matrix barcode
            
  A Data Matrix code is a two-dimensional matrix barcode
  consisting of black and white "cells" or modules
  arranged in either a square or rectangular pattern. The
  information to be encoded can be text or numeric data.
  Usual data size is from a few bytes up to 1556 bytes. 

  ECMC Uses data matrix on slides
  
  Scenario: Data Matrix on EPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      barcode :data_matrix, 'hello', :at => [1,2]
    end
    """
    When I execute the DSL
    Then the output should include "b1,2,D,c16,r16,"hello""

  Scenario: Data Matrix with offset on EPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      position(10,10) do
        barcode :data_matrix, 'hello', :at => [5,5]
      end
    end
    """
    When I execute the DSL
    Then the output should include "b15,15,D,c16,r16,"hello""
    
  Scenario: Data Matrix on ZPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      barcode :data_matrix, 'hello', :at => [1,2]
    end
    """
    When I execute the DSL
    Then the output should include "^BXN,4,200,16,16"
    And the output should include "^FDhello^FS"
    And the output should include "^FO1,2"
    

  Scenario: Data Matrix with offset on ZPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      position(10,10) do
        barcode :data_matrix, 'hello', :at => [5,5]
      end
    end
    """
    When I execute the DSL
    Then the output should include "^BXN,4,200,16,16"
    And the output should include "^FDhello^FS"
    And the output should include "^FO15,15"
