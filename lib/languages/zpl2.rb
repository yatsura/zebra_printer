require_relative 'zpl2/font'
require_relative 'zpl2/document'
require_relative 'zpl2/text'
require_relative 'zpl2/position'
require_relative 'zpl2/barcode'
require_relative 'zpl2/merge_font'
require_relative 'zpl2/speed'

module Languages
  class Zpl2
    def initialize
      @document = Zpl2::Document.new
      @font = Zpl2::Font.new
      @merge_font = MergeFont.new
      @position = Zpl2::Position[0,0]
      @document << @position
      @document << @merge_font.add({:name => 'B', :height => 15, :width => 15})
    end

    def text(text,opts={})
      if opts.include? :at
        @document << (@position + Zpl2::Position.from_array(opts[:at]))
      end
      @document << Zpl2::Text.new(text)
      @document << @position if opts.include?(:at)
    end

    def rotate(amount, &block)
      if block_given?
        @font = @merge_font.add({:rotation => amount})
        @document << @font
        self.instance_eval &block
        @font = @merge_font.remove
        @document << @font
      else
        @font.font_rotation amount
        @document << @font
      end
    end

    def font(opts={},&block)
      if block_given?
        @font = @merge_font.add(opts)
        @document << @font
        self.instance_eval &block
        @font = @merge_font.remove
        @document << @font
      else
        @font = Zpl2::Font.new(opts)
        @document << @font
      end
    end

    def barcode(*args)
      opts = args.extract_options!
      code,text = args.pop 2

      opts = opts.merge({:font => @font,:text => text})

      if opts.include? :at
        @document << (@position + Zpl2::Position.from_array(opts[:at]))
      end

      @document << Zpl2::BarcodeFactory.create_barcode(code, opts)
    end

    def position(x,y,&block)
      if block_given?
        save = @position
        @position = Zpl2::Position[x,y]
        @document << @position
        self.instance_eval(&block)
        @position = save
      else
        @position = Zpl2::Position[x,y]
      end
      @document << @position
    end

    def speed(amount)
      @document << Zpl2::Speed.new(amount)
    end

    def document
      @document.render
    end
  end
end
