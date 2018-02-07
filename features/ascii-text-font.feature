Feature: ASCII Text Font
  The DSL support the change of fonts

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

  Scenario: Font A Text on ZPL2 out of order
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      font(:name => 'A') do
        font(:size => :x_large) do
          text ''
        end
      end
    end
    """
    When I execute the DSL
    Then the output should include "^AA,N,60,60"
