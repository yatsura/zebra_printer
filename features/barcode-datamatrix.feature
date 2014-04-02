Feature: Data matrix barcode
            
  A Data Matrix code is a two-dimensional matrix barcode
  consisting of black and white "cells" or modules
  arranged in either a square or rectangular pattern. The
  information to be encoded can be text or numeric data.
  Usual data size is from a few bytes up to 1556 bytes. 

  ECMC Uses data matrix on slides
  
  Scenario: Data Matrix on EPL
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      barcode :data_matrix, 'hello', :at => [1,2]
    end
    """
    When I execute the DSL
    Then the output should include "b1,2,D,c16,r16,"hello""
    
  Scenario: Data Matrix 128 on ZPL
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      barcode :data_matrix, 'hello', :at => [1,2]
    end
    """
    When I execute the DSL
    Then the output should include "^BXN,1,200,16,16"
    And the output should include "^FDhello^FS"
    And the output should include "^FO1,2"
    
