Feature: ASCII Text Size
  The DSL provides a number of default sizes.
  Due to the way sizes work across languages
  size and font have been extracted out. This
  means that the size will be approximate

  Scenario: Font A Text on ZPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      font(:size => :large, :name => 'A') do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "\^AA,N,\d+,\d+"

Scenario: Font 0 Text on ZPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      font(:size => :large, :name => '0') do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "\^A0,N,\d+,\d+"
