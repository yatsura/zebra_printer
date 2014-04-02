Feature: ASCII Text Size
  The DSL provides a number of default sizes.
  Due to the way sizes work across languages
  size and font have been extracted out. This
  means that the size will be approximate

  Scenario: Normal Text on EPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      font(:size => :normal) do
        text 1,0,''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "A\d,\d,\d,2,\d,\d,[A-Z]"

  Scenario: Normal Text on ZPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      font(:size => :normal) do
        text 1,0,''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "\^ABN"
