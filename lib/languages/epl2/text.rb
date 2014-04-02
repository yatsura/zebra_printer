module Languages
  class Epl2
    class Text
      def initialize(font)
        @font = font
      end
      
      def render(x,y,text)
        "A#{x},#{y},#{@font.rotation},#{@font.name},#{@font.height},#{@font.width},N,\"#{text}\""
      end
    end
  end
end
