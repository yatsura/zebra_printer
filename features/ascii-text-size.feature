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
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "A\d,\d,\d,2,1,1,[A-Z]"

  Scenario: Normal Text on EPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :epl2
      font(:size => :large) do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "A\d,\d,\d,3,1,1,[A-Z]"

  Scenario: Normal Text on ZPL2
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      font(:size => :normal) do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "\^A[A-Z0-9],N,\d+,\d+"

  Scenario: Array as size
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      font(:size => [0,160,160]) do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "\^A0,N,160,160"

