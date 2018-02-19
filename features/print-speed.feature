Feature: Print speed
  The DSL support to change the print spead
  it supports: slow, normal, fast

  Scenario: Fast speed
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      speed :fast
      font(:size => :large, :name => 'A') do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "\^PRC,[A-Z0-9],[A-Z0-9]"

  Scenario: Normal speed
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      speed :normal
      font(:size => :large, :name => 'A') do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "\^PRA,[A-Z0-9],[A-Z0-9]"

  Scenario: Slow speed
    Given a DSL with:
    """ruby
    ZebraPrinterDocument.new do
      language :zpl2
      speed :slow
      font(:size => :large, :name => 'A') do
        text ''
      end
    end
    """
    When I execute the DSL
    Then the output should be like "\^PR1,[A-Z0-9],[A-Z0-9]"
