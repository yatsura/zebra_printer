module Languages
  class Zpl2
    def initialize
      @document = document_start

      # defaults
      @font_name = "A"
      @font_orientation = "N"
      @char_height = 32
      @char_width = 32
    end
    # TODO Escape seqs
    def text(x,y,text,opts={})
      origin x,y
      @document.concat "^FD#{text}^FS\n"
    end

    def rotate(amount, &block)
      temp_rot = @font_orientation
      @font_orientation = case(amount)
                          when :by_90
                            "R"
                          when :by_180
                            "I"
                          when :by_270
                            "B"
                          else
                            "N"
                          end
      reset_font
      self.instance_eval(&block)
      @font_orientation = temp_rot
      reset_font
    end

    def font(name,orientation,height,width,&block)
      @document.concat("^A#{name}#{orientation},#{height},#{width}\n")
      if block_given?        
        self.instance_eval(&block)
        reset_font
      else
        @font_name, @font_orientation, @char_height, @char_width = name, orientation, height, width
      end
    end

    def reset_font
      @document.concat("^A#{@font_name}#{@font_orientation},#{@char_height},#{@char_width}\n")
    end
    
    def document_start
      "^XA\n"
    end

    def document_end
      "^XZ\n"
    end

    def document
      @document.concat(document_end)
    end
    private
    def origin(x,y)
      @document.concat "^FO#{x},#{y}\n"
    end
  end
end
