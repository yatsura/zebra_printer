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

  Scenario: Data nested in document
    Given some array data
    And a DSL with:
    """ruby
    ZebraPrinterDocument.new(@data) do
      language :zpl2
      rotate :by_90 do
        font(:name => 'H', :size => :normal) do
          position(730,50) do
            barcode :code_128, data.first.barcode, :height => 100
          end
        end
      end
    end
    """    
    When I execute the DSL
    Then the output should include "^FD111111^FS"
