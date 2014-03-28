module Languages
  class Epl2
    def initialize
      @document = document_start
      #defaults
      @rotation = 0
      @font_size = 2
    end
    def text(x,y,text,opts={})
      @document.concat "A#{x},#{y},#{@rotation},#{@font_size},1,1,N,\"#{text}\"\n"
    end

    def document_start
      "N\n"
    end

    def document_end
      "P1\n"
    end

    def document
      @document.concat document_end
    end
    def rotate(amount,&block)
      temp_rot = @rotation
      @rotation = case(amount)
                  when :by_90
                    1
                  when :by_180
                    2
                  when :by_270
                    3
                  else
                    0
                  end
      self.instance_eval(&block)
      @rotation = temp_rot
    end

    def font(opts={},&block)
      if opts.include? :size
        font_size opts[:size]
      end
      if block_given?
        save = @font_size
        self.instance_eval(&block)
        @font_size = save
      end
    end

    def font_size(size)
      @font_size = case(size)
                   when :normal
                     2
                   when :small
                     1
                   when :large
                     3
                   when :x_large
                     4
                   else
                     2
                   end
    end

    def reset_font
      @document.concat("^A#{@font_name}#{@font_orientation},#{@char_height},#{@char_width}\n")
    end
  end
end
