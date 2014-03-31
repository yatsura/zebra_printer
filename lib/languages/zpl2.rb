require_relative 'zpl2/font'
require_relative 'zpl2/document'
require_relative 'zpl2/text'
require_relative 'zpl2/position'
require_relative 'zpl2/barcode'

module Languages
  class Zpl2
    def initialize
      @document = Zpl2::Document.new
      @font = Zpl2::Font.new
    end
    
    def text(x,y,text,opts={})
      @document << Zpl2::Position.new(x,y)
      @document << Zpl2::Text.new(text)
    end

    def rotate(amount, &block)
      if block_given?
        @document << Zpl2::Font.new(:rotation => amount)
        self.instance_eval &block
        @document << @font
      else
        @font.font_rotation amount
        @document << @font
      end
    end

    def font(opts={},&block)
      if block_given?
        @document << Zpl2::Font.new(opts)
        self.instance_eval &block
        @document << @font
      else
        @font = Zpl2::Font.new(opts)
        @document << @font
      end
    end

    def barcode(*args)
      opts = args.extract_options!
      code,text = args.pop 2
      b = Zpl2::Barcode.new @font, code,opts
      if opts.include? :at
        x,y = opts[:at].pop 2
        @document << Zpl2::Position.new(x,y)
      end
      @document << b.render(text)
    end

    def document
      @document.render
    end
  end
end
