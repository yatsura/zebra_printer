module Languages
  class Epl2
    def initialize
      @document = document_start
      #defaults
      @rotation = 0 
    end
    def text(x,y,text,opts={})
      @document.concat "A#{x},#{y},#{@rotation},1,1,1,N,\"#{text}\"\n"
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
  end
end
