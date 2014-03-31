require_relative 'epl2/font'
require_relative 'epl2/document'
require_relative 'epl2/text'
require_relative 'epl2/position'

module Languages
  class Epl2
    def initialize
      @document = Epl2::Document.new
      #defaults
      @rotation = 0
      @font = Epl2::Font.new
    end
    def text(x,y,text,opts={})
      @document << Epl2::Text.new(@font).render(x,y,text)
    end

    def document
      @document.render
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
  end
end
