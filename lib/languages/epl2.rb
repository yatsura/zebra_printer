require_relative 'epl2/font'
require_relative 'epl2/document'
require_relative 'epl2/text'
require_relative 'epl2/position'
require_relative 'epl2/barcode'
require_relative 'epl2/position'
require_relative '../utils/array'

module Languages
  class Epl2
    def initialize(data=nil)
      @data = data
      @document = Epl2::Document.new
      #defaults
      @font = Epl2::Font.new
      @position = Epl2::Position[0,0]
    end

    def document
      @document.render
    end

    def text(value,opts={})
      if opts.include? :at
        opts[:at] = (@position + Epl2::Position.from_array(opts[:at])).to_a
      else
        opts[:at] = @position.to_a
      end
      @document << Epl2::Text.new(:font => @font, :at => opts[:at], :text => value)
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

      opts = opts.merge({:font => font,:text =>text})
      if opts.include? :at
        opts[:at] = (@position + Epl2::Position.from_array(opts[:at])).to_a
      end

      b = Epl2::BarcodeFactory.create_barcode code,opts
      @document << b.render
    end

    def position(x,y,&block)
      if block_given?
        save = @position
        @position = Epl2::Position[x,y]
        self.instance_eval(&block)
        @position = save
      else
        @position = Epl2::Position[x,y]
      end
    end

    def data
      @data
    end
  end
end
