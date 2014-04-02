require_relative 'epl2/font'
require_relative 'epl2/document'
require_relative 'epl2/text'
require_relative 'epl2/position'
require_relative 'epl2/barcode'
require_relative 'epl2/position'
require_relative '../utils/array'

module Languages
  class Epl2
    def initialize
      @document = Epl2::Document.new
      #defaults
      @font = Epl2::Font.new
      @position = Epl2::Position.new(0,0)
    end

    def document
      @document.render
    end

    def text(text,opts={})
      if opts.include? :at
        x,y = opts[:at][0], opts[:at][1]
      else
        x,y = 0,0
      end
      @document << Epl2::Text.new(@font).render(@position.x + x,@position.y + y,text)
    end

    def rotate(amount,&block)
      if block_given?
        save = @font
        @font.font_rotation amount
        self.instance_eval(&block)
        @font = save
      else
        @font.font_rotation amount
      end
    end

    def font(opts={},&block)
      if opts.include? :size
        @font = Epl2::Font.new(opts)
      end
      if block_given?
        save = @font
        @font = Epl2::Font.new(opts)
        self.instance_eval(&block)
        @font = save
      end
    end

    def barcode(*args)
      opts = args.extract_options!
      code,text = args.pop 2
      b = Epl2::BarcodeFactory.create_barcode @font,code,opts
      x, y = 0
      x, y = opts[:at].pop(2) if opts.include?(:at)
      @document << b.render(@position.x + x,@position.y + y,text)
    end

    def position(x,y,&block)
      if block_given?
        save = @position
        @position = Epl2::Position.new x,y
        self.instance_eval(&block)
        @position = save
      else
        @position = Epl2::Position.new x,y
      end
    end
  end
end
